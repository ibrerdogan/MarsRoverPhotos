//
//  LatestPhotosModel.swift
//  MarsRoverPhotos
//
//  Created by İbrahim Erdogan on 14.10.2022.
//


import Foundation

// MARK: - LastPhotos
struct LastPhotos: Codable {
    let photos: [APIPhoto]

    enum CodingKeys: String, CodingKey {
        case photos = "latest_photos"
    }
}


