//
//  RoverPhotosView.swift
//  MarsRoverPhotos
//
//  Created by İbrahim Erdogan on 14.10.2022.
//

import SwiftUI

struct RoverPhotosView: View {
    @StateObject var viewModel : LatestPhotosViewModel
    @Environment(\.presentationMode) var presentationMode
    @State var date = Date.now
    @State var camera = ""
    @State var PerseverenceCamera = PerseveranceCameras.none
    init(rover : String)
    {
        self._viewModel = StateObject(wrappedValue: LatestPhotosViewModel(roverName: rover))
    }
    
    var body: some View {
            VStack{
                VStack {
                    VStack{
                        VStack{
                            Button {
                                presentationMode.wrappedValue.dismiss()
                            } label: {
                                HStack{
                                    Image(systemName: "chevron.left")
                                    Text("Back")
                                }
                                .padding(.horizontal)
                                Spacer()
                            }
                          
                            HStack{
                                Text(viewModel.roverName.capitalized + " Rover Photos")
                                    .font(.title3)
                            }
                        }
                        HStack{
                           
                            if viewModel.roverName == "curiosity"
                            {
                                Picker(selection: $camera) {
                                    ForEach(CuriosityCameras.allCases) { cam in
                                        Text(cam.name())
                                        
                                    }
                                } label: {
                                    Text(camera)
                                        .foregroundColor(.black)
                                }
                                .onChange(of: camera) { newValue in
                                    viewModel.fetchDatePhotos(date: viewModel.dateFormat(value: date),camera: newValue)
                                }
                            }
                            else if viewModel.roverName == "opportunity" ||  viewModel.roverName == "spirit"
                            {
                                Picker(selection: $camera) {
                                    ForEach(OpportunityAndSpiritCameras.allCases) { cam in
                                        Text(cam.name())
                                    }
                                } label: {
                                    Text(camera)
                                }
                                .onChange(of: camera) { newValue in
                                    viewModel.fetchDatePhotos(date: viewModel.dateFormat(value: date),camera: newValue)
                                }
                            }
                            else
                            {
                                Picker(selection: $camera) {
                                    ForEach(PerseveranceCameras.allCases) { cam in
                                        Text(cam.name())
                                    }
                                } label: {
                                    Text(PerseverenceCamera.rawValue)
                                }
                                .onChange(of: camera) { newValue in
                                    viewModel.fetchDatePhotos(date: viewModel.dateFormat(value: date),camera: newValue)
                                }
                            }
                            DatePicker("",selection: $date, displayedComponents: .date)
                                .onChange(of: date) { newValue in
                                    viewModel.fetchDatePhotos(date: viewModel.dateFormat(value: newValue),camera: nil)
                            }
                        }
                        .padding()
                    }
                }
                if viewModel.state == .good {
                    if viewModel.photos.count > 0 {
                        ScrollView{
                                ForEach(viewModel.photos){img in
                                    VStack{
                                        NavigationLink {
                                            FullscreenImageView(url: URL(string: img.imgSrc)!)
                                              
                                        } label: {
                                            RoverGridImageView(image: img, size: 200)
                                                
                                        }

                                            
                                    }
                                    Divider()
                                }
                        }
                    }
                    else
                    {
                        Text("There is no photo for this date")
                        Spacer()
                    }
                    
                } else if viewModel.state == .loading{
                    Spacer()
                    VStack{
                        ProgressView()
                            .progressViewStyle(.circular)
                        Text("Loading")
                            .padding()
                    }
                    Spacer()
                }
                else
                {
                    Text(viewModel.state.name())
                    Spacer()
                }
            }
            .onAppear {
                // for prevent fetch photos every time. for example no need to fetch again when come back from full screen
                if viewModel.photos.count == 0
                {
                    viewModel.fetchLatestPhotos()
                }
        }

    }
}

struct RoverPhotosView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            RoverPhotosView(rover: "")
        }
        .navigationBarHidden(true)
            
    }
}
