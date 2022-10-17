//
//  APIError.swift
//  MarsRoverPhotos
//
//  Created by İbrahim Erdogan on 14.10.2022.
//

import Foundation

enum APIError : Error , CustomStringConvertible
{
    
    case badURL // url yoksa bunu verir
    case urlSession(URLError) // url hatası
    case badResponse(Int) // bad response
    case decodingError(DecodingError?) // decode problem
    case unknown
    
    var description: String {
        switch self {
        case .badURL:
            return "badURL"
        case .urlSession(let error):
            return "urlSession \(error.localizedDescription)"
        case .badResponse(let statusCode):
            return "badResponse \(statusCode)"
        case .decodingError(let decodingError):
            return "decodingError \(decodingError?.localizedDescription ?? "decoding error")"
        case .unknown:
            return "unknown"
        }
    }
    
    var localizedDescription : String{
        switch self {
        case .badURL:
            return "something went wrong"
        case .urlSession(let uRLError):
            return uRLError.localizedDescription
        case .decodingError(let decodingError):
            return decodingError?.localizedDescription ?? "decoding error"
        case .unknown:
            return "something went wrong"
        case .badResponse(_):
            return "something went wrong"
        }
    }
    
}
