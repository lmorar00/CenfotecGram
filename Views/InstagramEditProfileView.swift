//
//  InstagramEditProfileView.swift
//  Instagram
//
//  Created by Luis Mora Rivas on 16/10/21.
//

import SwiftUI
import FirebaseAuth
import FirebaseStorage

struct InstagramEditProfileView: View {
    // Variables
    @EnvironmentObject var session: SessionStore
    @State private var userName: String = ""
    @State private var profileImage: Image!
    @State private var pickedImage: Image!
    @State private var showImgActionSheet =  false
    @State private var showingImagePicker =  false
    @State private var imageData: Data = Data()
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var error: String = ""
    @State private var showingAlert = false
    @State private var alertTitle: String = "Oh no 😭 "
    @State private var bio: String = ""
    
    init (session: UserModel?) {
        _bio = State(initialValue: session?.bio ?? "")
        _userName = State(initialValue: session?.userName ?? "")
    }
    
    
    
    var body: some View {
        ScrollView {
            
        }
    }
    
    /// Load image
    func loadImage() {
        guard let inputImage = pickedImage else {  return }
        
        profileImage = inputImage
    }
    
    /// Clear Fields
    func clearFields() {
        self.userName = ""
        self.bio = ""
    }
    
    /// Check if the fields are complete
    func errorCheck() -> String? {
        if userName.trimmingCharacters(in: .whitespaces).isEmpty ||
            bio.trimmingCharacters(in: .whitespaces).isEmpty ||
            imageData.isEmpty {
            
            return "Por favor complete todos los campos y seleccion una imagen"
        }
        
        return nil
    }
    
    func editProfile() {
        if let error = errorCheck() {
            self.error = error
            self.showingAlert = true
            return
        }
        
        guard let userId = Auth.auth().currentUser?.uid else { return}
        
        let storageProfileUserId = StorageService.getStorateProfileId(userId: userId)
        
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpg"
        
        StorageService.editProfile(userId: userId, username: userName, bio: bio, imageData: imageData, metaData: metadata, storageProfileImageRef: storageProfileUserId, onError: {
            (errorMessage) in
            
            self.error = errorMessage
            self.showingAlert = true
            return
        })
        
        self.clearFields()
    }
}

