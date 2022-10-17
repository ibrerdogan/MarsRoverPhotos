//
//  DatePhotos.swift
//  MarsRoverPhotos
//
//  Created by İbrahim Erdogan on 14.10.2022.
//

import Foundation

// MARK: - LastPhotos
struct DatePhotos: Codable {
    let photos: [APIPhoto]
    enum CodingKeys: String, CodingKey {
        case photos = "photos"
    }
}




