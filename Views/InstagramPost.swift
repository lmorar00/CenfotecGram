//
//  InstagramAdd.swift
//  Instagram
//
//  Created by Luis Mora Rivas on 15/10/21.
//

import SwiftUI

struct InstagramPost: View {
    // State variables
    @State private var postImage: Image!
    @State private var pickedImage: Image!
    @State private var showImgActionSheet =  false
    @State private var showingImagePicker =  false
    @State private var imageData: Data = Data()
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var error: String = ""
    @State private var showingAlert = false
    @State private var alertTitle: String = "Oh no 😭 "
    @State private var postText = ""
    
    var body: some View {
        VStack {
            Text("Subir una publicación")
                .font(.largeTitle)
            
            VStack {
                if postImage != nil {
                    postImage!.resizable()
                        .frame(width: 300, height: 200)
                        .onTapGesture {
                            self.showImgActionSheet = true
                        }
                } else {
                    Image(systemName: "photo.fill")
                        .resizable()
                        .frame(width: 250, height: 200)
                        .onTapGesture {
                            self.showImgActionSheet = true
                        }
                }
            }
            
            
            TextEditor(text: $postText)
                .frame(height: 200)
                .padding(4)
                .background(RoundedRectangle(cornerRadius: 8).stroke(Color.black))
                .padding(.horizontal)
            
            
            Button(action: uploadPost) {
                Text("Subir publicación")
                    .font(.title)
                    .modifier(ButtonModifiers())
            }
            .padding(.top, 10)
            .padding(.horizontal)
            .alert(isPresented: $showingAlert) {
                Alert(title: Text(alertTitle), message: Text(error), dismissButton: .default(Text("Ok")))
            }
        }
        .padding()
        .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
            InstagramImagePicker(pickedImage: self.$pickedImage, showImagePicker: self.$showingImagePicker, imageData: self.$imageData)
        }.actionSheet(isPresented: $showImgActionSheet) {
            ActionSheet(title: Text(""), buttons: [.default(Text("Selecione una foto")){
                self.sourceType = .photoLibrary
                self.showingImagePicker = true
            },
            .default(Text("Capture una foto")){
                self.sourceType = .camera
                self.showingImagePicker = true
            },
            .cancel()
            
            ])
        }
        
    }
    
    /// Load Post Image
    func loadImage() {
        guard let inputImage = pickedImage else {  return }
        
        postImage = inputImage
    }
    
    
    /// Validate that fields are completed
    func errorCheck() -> String? {
        if postText.trimmingCharacters(in: .whitespaces).isEmpty || imageData.isEmpty {
            
            return "Por favor agregue un título y seleccion una imagen"
        }
        
        return nil
    }
    
    /**
     Clear Fields
     */
    func clearFields() {
        self.postText = ""
        self.imageData = Data()
        self.postImage = Image(systemName: "photo.fill")
    }
    
    /// Upload the post
    func uploadPost() {
        if let error = errorCheck() {
            self.error = error
            self.showingAlert = true
            return
        }
        
        PostService.uploadPost(caption: postText, imageData: imageData, onSuccess: {
            self.clearFields()
        }) {
            (errorMessage) in
            self.error = errorMessage
            self.showingAlert = true
            return
        }
    }
}



struct InstagramPost_Previews: PreviewProvider {
    static var previews: some View {
        InstagramPost()
    }
}
