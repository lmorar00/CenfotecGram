//
//  InstagramImagePicker.swift
//  Instagram
//
//  Created by Luis Mora Rivas on 16/9/21.
//

import Foundation
import SwiftUI

struct InstagramImagePicker: UIViewControllerRepresentable {
    @Binding var pickedImage: Image?
    @Binding var showImagePicker: Bool
    @Binding var imageData: Data
    
    func makeCoordinator() -> InstagramImagePicker.Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> some UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.allowsEditing = true
        return picker
    }
    
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: InstagramImagePicker
        
        init(_ parent: InstagramImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            let uiImage = info[.editedImage] as! UIImage
            parent.pickedImage = Image(uiImage: uiImage)
            
            if let mediaData = uiImage.jpegData(compressionQuality: 0.5) {
                parent.imageData = mediaData
            }
            parent.showImagePicker = false
        }
    }
}
