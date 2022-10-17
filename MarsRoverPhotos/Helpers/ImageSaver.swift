//
//  ImageSaver.swift
//  MarsRoverPhotos
//
//  Created by İbrahim Erdogan on 17.10.2022.
//

import Foundation
import UIKit


class ImageSaver: NSObject , ObservableObject {
    
    @Published var state = imageSavingStatus.good
    
    func getImageFromURL(urlString : URL)
    {
        print("start \(Date.now)")
        state = .loading
        do{
            let data = try Data(contentsOf: urlString)
            if let image = UIImage(data: data)
            {
                writeToPhotoAlbum(image: image)
            }
            else
            {
                state = .error
            }
            
        }
        catch{
            state = .error
        }
    }
    
    func writeToPhotoAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveCompleted), nil)

    }

    @objc func saveCompleted(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        state = .loaded
        print("end \(Date.now)")
    }
}

/**
 if let data = try Data(contentsOf: urlString)
 {
     
     if let data = try? Data(contentsOf: urlString){
         let image = UIImage(data: data)
         writeToPhotoAlbum(image: image!)
     }
 }
 */
