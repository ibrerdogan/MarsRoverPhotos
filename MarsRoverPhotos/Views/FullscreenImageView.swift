//
//  FullscreenImageView.swift
//  MarsRoverPhotos
//
//  Created by İbrahim Erdogan on 14.10.2022.
//

import SwiftUI


struct FullscreenImageView: View {
    let url : URL
    @State var picXPositon = 0.0
    @State var picYPositon = 0.0
    @State var scale = 1.0
    @State var value = 0.0
    @StateObject var imageSaver = ImageSaver()
    
    var body: some View {
        VStack{
            GeometryReader { proxy in
               AsyncImage(url: url) { image in
                       image
                       .resizable()
                       .ignoresSafeArea()
                       .scaledToFill()
                       .scaleEffect(scale)
                       .position(x: picXPositon, y: picYPositon)
                       .overlay(content: {
                           VStack{
                               Spacer()
                               HStack{
                                   VStack(alignment:.center){
                                       Button {
                                           picYPositon += 10
                                       } label: {
                                           Image(systemName: "arrow.up")
                                               .font(.title)
                                               .foregroundColor(.white)
                                               .padding()
                                       }
                                       HStack{
                                           Button {
                                               picXPositon += 10
                                           } label: {
                                               Image(systemName: "arrow.left")
                                                   .font(.title)
                                                   .foregroundColor(.white)
                                                   .padding()
                                           }
                                           Button {
                                               picXPositon -= 10
                                           } label: {
                                               Image(systemName: "arrow.right")
                                                   .font(.title)
                                                   .foregroundColor(.white)
                                                   .padding()
                                           }
                                       }
                                       Button {
                                           picYPositon -= 10
                                       } label: {
                                           Image(systemName: "arrow.down")
                                               .font(.title)
                                               .foregroundColor(.white)
                                               .padding()
                                       }
                                       
                                   }
                                   Spacer()
                                   Button {
                                       imageSaver.getImageFromURL(urlString: url)
                                   } label: {
                                       Text("Save Image")
                                           .foregroundColor(.red)
                                           .bold()
                                           
                                   }

                                   Spacer()
                                   VStack{
                                       Button {
                                           scale += 0.05
                                       } label: {
                                           Image(systemName: "plus.magnifyingglass")
                                               .font(.title)
                                               .foregroundColor(.white)
                                               .padding()
                                       }
                                       Button {
                                           scale -= 0.05
                                       } label: {
                                           Image(systemName: "minus.magnifyingglass")
                                               .font(.title)
                                               .foregroundColor(.white)
                                               .padding()
                                       }
                                   }
                               }

                           }
                           .opacity(imageSaver.state == .loading ? 0.2 : 1)
                       })
                       .onAppear {
                           picXPositon = proxy.frame(in: .local).midX
                           picYPositon = proxy.frame(in: .local).midY
                       }
               } placeholder: {
                   ProgressView()
               }
            }
        }
        
        .onChange(of: imageSaver.state) { newValue in
            if newValue == .loaded {
                print("loaded")
            }
        }
      

    }
}

struct FullscreenImageView_Previews: PreviewProvider {
    static var previews: some View {
        FullscreenImageView(url: URL(string: "")!)
        //FullscreenImageView()
           
    }
}
