//
//  ContentView.swift
//  Instafilter
//
//  Created by Jumoke Bolanle on 7/2/23.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI


class ImageSaver: NSObject {
    func writeToPhotoAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveCompleted), nil)
    }
    
    @objc func saveCompleted(_ image: UIImage, didFinishSavingWithError error:  Error?, contextInfo: UnsafeRawPointer) {
        print("Save finished!")
    }
}

struct ContentView: View {

    var body: some View {
        VStack {
            Text("Hello World")
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
