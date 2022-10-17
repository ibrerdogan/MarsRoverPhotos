//
//  ContentView.swift
//  MarsRoverPhotos
//
//  Created by İbrahim Erdogan on 13.10.2022.
//

import SwiftUI

struct ContentView: View {
    let gridItems = [GridItem(.fixed(250)),GridItem(.fixed(250))]
   
    var body: some View {
       
            VStack {
                Spacer()
                VStack {
                    Text("Select Your Rover")
                        .font(.title)
                        .foregroundColor(Color.white)
                        .bold()
                    LazyHGrid(rows: gridItems) {
                        ForEach(roverName.allCases){rover in
                            NavigationLink {
                                RoverPhotosView(rover: rover.rawValue)
                                    .navigationBarHidden(true)
                                    .navigationBarBackButtonHidden(true)
                            } label: {
                                RoverImageView(roverType: rover)
                                    .foregroundColor(Color.white)
                            }

                        }
                        
                    }
                    
                    Text("Thanks a lot for this hady api")
                        .font(.footnote)
                        .foregroundColor(Color.white)
                }
               Spacer()
            }
            .ignoresSafeArea()
            .background(){
                Image("background")
                    .resizable()
                    .scaleEffect(1.2)
                    .ignoresSafeArea()
                    .scaledToFill()
            }
            
        
      
        
      
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ContentView()
        }
        .navigationBarHidden(true)
           
      
    }
}
