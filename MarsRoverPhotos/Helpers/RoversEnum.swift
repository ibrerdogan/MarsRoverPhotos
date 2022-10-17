//
//  RoversEnum.swift
//  MarsRoverPhotos
//
//  Created by İbrahim Erdogan on 14.10.2022.
//

import Foundation

enum roverName : String , Identifiable , Equatable, CaseIterable
{
    case curiosity
    case opportunity
    case perseverance
    case spirit
    
    var id : String {
        return self.rawValue
    }
    
    func name() -> String
    {
        switch self {
        case .curiosity:
            return "Curiosity"
        case .opportunity:
            return "Opportunity"
        case .perseverance:
            return "Perseverance"
        case .spirit:
            return "Spirit"
        }
    }
   
}
