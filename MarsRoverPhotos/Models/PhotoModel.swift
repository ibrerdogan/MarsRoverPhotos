//
//  Photo.swift
//  MarsRoverPhotos
//
//  Created by İbrahim Erdogan on 17.10.2022.
//

import Foundation

struct APIPhoto: Codable ,Identifiable {
    let id, sol: Int
    let camera: Camera
    let imgSrc: String
    let earthDate: String
    let rover: Rover

    enum CodingKeys: String, CodingKey {
        case id, sol, camera
        case imgSrc = "img_src"
        case earthDate = "earth_date"
        case rover
    }
    
    static func example()-> APIPhoto
    {
        let photo = APIPhoto(id: 1, sol: 1000, camera: Camera.example() , imgSrc: "https://mars.nasa.gov/msl-raw-images/proj/msl/redops/ods/surface/sol/03621/opgs/edr/ncam/NRB_718950293EDR_S0971734NCAM00594M_.JPG", earthDate: "tarih", rover: Rover.example())
        return photo
    }
}



// MARK: - Camera
struct Camera: Codable {
    let id: Int
    let name: String?
    let roverID: Int
    let fullName: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case roverID = "rover_id"
        case fullName = "full_name"
    }
    static func example()->Camera
    {
        return Camera(id: 1, name: "test camera", roverID: 0, fullName: "test camera")
    }
}

enum FullName: String, Codable {
    case navigationCamera = "Navigation Camera"
}

enum CameraName: String, Codable {
    case navcam = "NAVCAM"
}

// MARK: - Rover
struct Rover: Codable {
    let id: Int
    let name: String?
    let landingDate, launchDate: String
    let status: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case landingDate = "landing_date"
        case launchDate = "launch_date"
        case status
    }
    
    static func example()->Rover
    {
        return Rover(id: 1, name: "rover name", landingDate: "landingDate", launchDate: "LaunchDate", status: "")
    }
}

enum RoverName: String, Codable {
    case curiosity = "Curiosity"
}

enum Status: String, Codable {
    case active = "active"
}

