//
//  LatestPhotosViewModel.swift
//  MarsRoverPhotos
//
//  Created by İbrahim Erdogan on 14.10.2022.
//

import Foundation

class LatestPhotosViewModel : ObservableObject
{
    @Published var photos : [APIPhoto] = []
    @Published var state = ApiState.good
    var service = SeviceAPI()
    var roverName : String
    
    init(roverName : String)
    {
        self.roverName = roverName
       
    }
    
    func fetchLatestPhotos()
    {
        self.state = ApiState.loading
        photos.removeAll()
        service.getLastestPhotos(roverName: self.roverName) {[weak self] result in
            switch result{
            case .failure(let error):
                self?.state = ApiState.error
                print(error.description)
            case.success(let result):
                DispatchQueue.main.sync {
                    self?.photos = result.photos
                }
                DispatchQueue.main.sync {
                    self?.state = ApiState.good
                }
            }
        }
    }
    
    func fetchDatePhotos(date : String, camera : String?)
    {
        self.state = ApiState.loading
        photos.removeAll()
        if let camera = camera {
          if camera != "All Cameras"
            {
              service.getDatePhotosWithCameraName(roverName: self.roverName, date: date, camera: camera) {[weak self] result in
                  switch result{
                  case .failure(let error):
                      self?.state = ApiState.error
                      print(error.description)
                  case.success(let result):
                      DispatchQueue.main.sync {
                          self?.photos = result.photos
                      }
                      DispatchQueue.main.sync {
                          self?.state = ApiState.good
                      }
                  }
              }
          }
        }
        else
        {
            service.getDatePhotos(roverName: self.roverName, date: date,camera: nil) { [weak self] result in
                switch result{
                case .failure(let error):
                    self?.state = ApiState.error
                    print(error.description)
                case.success(let result):
                    DispatchQueue.main.sync {
                        self?.photos = result.photos
                    }
                    DispatchQueue.main.sync {
                        self?.state = ApiState.good
                    }
                }
            }
        }
    }
    
    
    func dateFormat(value : Date) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .none
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.string(from: value)
        return date
    }
   // func fetchLatestPhotos(date : String?)
   // {
   //     photos.removeAll()
   //     state = "start"
   //     var url : URL?
   //     if let date = date {
   //         url = createURL(roverName: roverName,date: date)
   //     }
   //     else
   //     {
   //         url = createURL(roverName: roverName,date: nil)
   //     }
   //
   //     guard let url = url else {
   //         state = "url problem"
   //         return
   //     }
   //     print("no problem with url")
   //     URLSession.shared.dataTask(with: url) { data, response, error in
   //         print("url started")
   //         if let error = error , let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode)  {
   //             print("url error",error.localizedDescription)
   //             self.state = "hata response or error \(error.localizedDescription)"
   //             return
   //         }
   //         else
   //         {
   //             print("no error good response")
   //             if let data = data {
   //                 print("good data")
   //                 do{
   //                    let photo = try JSONDecoder().decode(LastPhotos.self, from: data)
   //                     DispatchQueue.main.async {
   //                         for photo in photo.latestPhotos
   //                         {
   //                             self.photos.append(photo)
   //                             self.state = String(photo.id)
   //                         }
   //                     }
   //                 }
   //                 catch
   //                 {
   //                     print("error")
   //                     print(String(describing: error))
   //                     //self.state = error.localizedDescription
   //                 }
   //             }
   //             print("bilinmez")
   //         }
   //     }.resume()
   // }
    
   // func createURL(roverName : String,date : String?) -> URL?
   // {
   //
   //     if let date = date {
   //         // let url = "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/latest_photos?api_key=Dc5HC1PmOk6MbzzgYhco8Mb98liebmsJK4xsD4lD"
   //          let url = "https://api.nasa.gov/mars-photos/api/v1/rovers/\(roverName)/photos?earth_date=\(date)&api_key=Dc5HC1PmOk6MbzzgYhco8Mb98liebmsJK4xsD4lD"
   //          print(url)
   //          print("created url")
   //          return URL(string: url)
   //     }
   //     else{
   //         // let url = "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/latest_photos?api_key=Dc5HC1PmOk6MbzzgYhco8Mb98liebmsJK4xsD4lD"
   //          let url = "https://api.nasa.gov/mars-photos/api/v1/rovers/\(roverName)/latest_photos?api_key=Dc5HC1PmOk6MbzzgYhco8Mb98liebmsJK4xsD4lD"
   //          print(url)
   //          print("created url")
   //          return URL(string: url)
   //     }
   // }
}
