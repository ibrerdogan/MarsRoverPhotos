//
//  RoverGridImageView.swift
//  MarsRoverPhotos
//
//  Created by İbrahim Erdogan on 14.10.2022.
//

import SwiftUI

struct RoverGridImageView: View {
    let image : APIPhoto
    let size : CGFloat
    var body: some View {
        
        HStack{
            VStack(alignment:.leading){
                AsyncImage(url: URL(string: image.imgSrc)) { img in
                    img
                        .resizable()
            
                } placeholder: {
                    ProgressView()
                }
                .frame(width: size, height: size, alignment: .leading)
                .scaledToFill()
                
            }
            .padding(.leading)
            Spacer()
            VStack(alignment:.leading){
                Text(image.rover.name ?? "name")
                    .font(.title)
                Text(image.camera.fullName ?? "fullname").lineLimit(1)
                    .font(.headline)
                Spacer()
                VStack(alignment: .leading){
                    Text("Image Id: \(image.id)")
                    Text("Mars Date :\(image.sol)")
                    Text("Earth Date : "+image.earthDate)
                    Text("Rover Status : "+(image.rover.status ?? "status"))
                        .foregroundColor((image.rover.status == "active") ? .green : .red )
                }
                .font(.caption)
                }
            .padding([.bottom,.top,.trailing])
            .foregroundColor(Color("foregroundColor"))
        }
        .frame(width : UIScreen.main.bounds.width,height: size )
       
        
     
    }
}

struct RoverGridImageView_Previews: PreviewProvider {
    static var previews: some View {
        RoverGridImageView(image: APIPhoto.example(), size: 200)
    }
}
