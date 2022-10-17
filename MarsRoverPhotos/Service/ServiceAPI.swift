//
//  ServiceAPI.swift
//  MarsRoverPhotos
//
//  Created by İbrahim Erdogan on 14.10.2022.
//

import Foundation

class SeviceAPI : ObservableObject
{
    //TODO: secret APIKey OK
    //private var APIkey = "Dc5HC1PmOk6MbzzgYhco8Mb98liebmsJK4xsD4lD"
    private var APIkey : String = ""
      
    init()
    {
        if let key = Bundle.main.infoDictionary?["API_Key"] as? String
        {
            APIkey = key
            print(APIkey)
        }
        else
        {
            APIkey = ""
        }
       
    }
   
    
    func getLastestPhotos(roverName : String,completion : @escaping(Result<LastPhotos,APIError>)->Void)
    {
        guard let url = createURL(roverName: roverName, date: nil,camera: nil) else {return}
        fetch(type: LastPhotos.self, url: url, completion: completion)
    }
    
    func getDatePhotos(roverName : String,date : String , camera : String? ,completion : @escaping(Result<DatePhotos,APIError>)->Void)
    {
        guard let url = createURL(roverName: roverName, date: date,camera: nil) else {return}
        fetch(type: DatePhotos.self, url: url, completion: completion)
    }
    
    func getDatePhotosWithCameraName(roverName : String,date : String , camera : String ,completion : @escaping(Result<DatePhotos,APIError>)->Void)
    {
        guard let url = createURL(roverName: roverName, date: date,camera: camera) else {return}
        fetch(type: DatePhotos.self, url: url, completion: completion)
    }
    
    private func fetch<T : Codable>(type : T.Type ,url : URL , completion : @escaping(Result<T,APIError>)->())
    {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error , let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode)  {
                completion(Result.failure(APIError.badResponse(response.statusCode)))
                return
            }
            else
            {
                if let data = data {
                    do{
                       let photo = try JSONDecoder().decode(T.self, from: data)
                        completion(Result.success(photo))
                    }
                    catch
                    {
                       
                        //print(String(describing: error))
                        completion(Result.failure(APIError.decodingError(error as? DecodingError)))
                    }
                }
            }
        }.resume()
    }
    // let url = "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/latest_photos?api_key=Dc5HC1PmOk6MbzzgYhco8Mb98liebmsJK4xsD4lD"
    // let url = "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?earth_date=\(date)&api_key=Dc5HC1PmOk6MbzzgYhco8Mb98liebmsJK4xsD4lD"
    //https://api.nasa.gov/mars-photos/api/v1/rovers/opportunity/photos?earth_date=2015-6-3&api_key=Dc5HC1PmOk6MbzzgYhco8Mb98liebmsJK4xsD4lD&camera=pancam
    func createURL(roverName : String , date : String? , camera : String?) ->URL?
    {
        var queryItems : [URLQueryItem] = []
        var endPoint : String {
            if let date = date {
                queryItems.append(URLQueryItem(name: "earth_date", value: String(date)))
                return "photos"
            }
            else
            {
                return "latest_photos"
            }
        }
        let baseURL = "https://api.nasa.gov/mars-photos/api/v1/rovers/\(roverName)/\(endPoint)"
        queryItems.append(URLQueryItem(name: "api_key", value: String(APIkey)))
        if let camera = camera {
            queryItems.append(URLQueryItem(name: "camera", value: String(camera)))
        }
        var components = URLComponents.init(string: baseURL)
        components?.queryItems = queryItems
        
        print(components?.url?.absoluteURL ?? "")
        print(components?.url?.absoluteString.replacingOccurrences(of: "%22", with: "") ?? "")
        let url = URL(string: components?.url?.absoluteString.replacingOccurrences(of: "%22", with: "") ?? "" )
        
        return url
        
    }
    
    
    
}
