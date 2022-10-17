//
//  RoverImageView.swift
//  MarsRoverPhotos
//
//  Created by İbrahim Erdogan on 14.10.2022.
//

import SwiftUI

struct RoverImageView: View {
    var roverType : roverName
    var body: some View {
        VStack {
            Image(roverType.rawValue)
                .resizable()
                .frame(width:200,height: 200)
                .cornerRadius(20)
                .shadow(radius: 10)
            .scaledToFit()
            Text("\(roverType.name()) Rover")
        }
    }
}

struct RoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        RoverImageView(roverType: .curiosity)
    }
}
