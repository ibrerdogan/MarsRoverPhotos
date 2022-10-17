//
//  ZoomAndMoveTest.swift
//  MarsRoverPhotos
//
//  Created by İbrahim Erdogan on 15.10.2022.
//

import SwiftUI
//minus.magnifyingglass
//arrow.left
struct ZoomAndMoveTest: View {
    @State var picXPositon = 0.0
    @State var picYPositon = 0.0
    @State var scale = 1.0
    @State var value = 0.0
    var body: some View {
       
        VStack {
            GeometryReader { proxy in
                    Image("background")
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
                                            picYPositon -= 10
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
                                            picYPositon += 10
                                        } label: {
                                            Image(systemName: "arrow.down")
                                                .font(.title)
                                                .foregroundColor(.white)
                                                .padding()
                                        }
                                        
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
                        })
                        .onAppear {
                            picXPositon = proxy.frame(in: .local).midX
                            picYPositon = proxy.frame(in: .local).midY
                        }
                      
                   
              //  AsyncImage(url: url) { image in
              //          image
              //              .resizable()
              //              .aspectRatio(contentMode: .fit)
              //              .ignoresSafeArea()
              //  } placeholder: {
              //      ProgressView()
              //  }
            }
        }
    }
}

struct ZoomAndMoveTest_Previews: PreviewProvider {
    static var previews: some View {
        ZoomAndMoveTest()
    }
}
