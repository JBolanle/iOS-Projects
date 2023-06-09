//
//  ImagePicker.swift
//  Instafilter
//
//  Created by Jumoke Bolanle on 7/5/23.
//

import PhotosUI
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        config.filter = .images
        
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) { }
    
    typealias UIViewControllerType = PHPickerViewController
    
    //MARK: UIKIT STUFF
    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            
            // dismiss the picker
            picker.dismiss(animated: true)
            
            // exit if no selection is made
            guard let provider = results.first?.itemProvider else { return }
            
            // if this has an image we can use, use it
            if provider.canLoadObject(ofClass: UIImage.self) {
                provider.loadObject(ofClass: UIImage.self) { image, _ in
                    self.parent.image = image as? UIImage
                }
            }
        }
        
        var parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}
