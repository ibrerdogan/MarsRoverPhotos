//
//  ServiceState.swift
//  MarsRoverPhotos
//
//  Created by İbrahim Erdogan on 14.10.2022.
//

import Foundation


enum ApiState : String , Error , Identifiable , Equatable
{
    case good
    case loading
    case error
   
    
    var id : String {
        return self.rawValue
    }
    
    func name() -> String
    {
        switch self {
        case .good:
            return "Good"
        case .loading:
            return "Loagind"
        case .error:
            return "Error"
        
        }
    }
}
