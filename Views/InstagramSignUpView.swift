//
//  InstagramSignUpView.swift
//  Instagram
//
//  Created by Luis Mora Rivas on 15/9/21.
//

import SwiftUI

struct InstagramSignUpView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    //State variables
    @State private var userName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var passConfirm: String = ""
    @State private var profileImage: Image!
    @State private var pickedImage: Image!
    @State private var showImgActionSheet =  false
    @State private var showingImagePicker =  false
    @State private var imageData: Data = Data()
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var error: String = ""
    @State private var showingAlert = false
    @State private var alertTitle: String = "Oh no 😭 "
    
    func loadImage() {
        guard let inputImage = pickedImage else {  return }
        
        profileImage = inputImage
    }
    
    func errorCheck() -> String? {
        if email.trimmingCharacters(in: .whitespaces).isEmpty || password.trimmingCharacters(in: .whitespaces).isEmpty || userName.trimmingCharacters(in: .whitespaces).isEmpty || imageData.isEmpty {
            
            return "Por favor complete todos los campos y seleccion una imagen"
        }
        
        return nil
    }
    
    /**
     Clear Fields
     */
    func clearFields() {
        self.email = ""
        self.userName = ""
        self.password = ""
        self.imageData = Data()
        self.profileImage = Image(systemName: "person.circle.fill")
    }
    
    func signUp() {
        if let error = errorCheck() {
            self.error = error
            self.showingAlert = true
            return
        }
        
        AuthService.signUp(username: userName, email: email, password: password, imageData: imageData, onSuccess: {
            (user) in
            self.clearFields()
        }) {
            (errorMessage) in
            print("Error \(errorMessage)")
            self.error = errorMessage
            self.showingAlert = true
            return
        }
    }
    
    var body: some View {
        ScrollView {
            VStack (spacing: 20) {
                Image(systemName: "camera")
                    .font(.system(size: 60, weight: .black, design: .monospaced))
                    .foregroundColor(Color(.white))
                
                VStack(alignment: .center) {
                    Text("Bienvenido")
                        .font(.system(size: 32, weight: .heavy))
                        .foregroundColor(.white)
                    Text("Registrate para empezar")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.white)
                }
                
                VStack {
                    Group {
                        if profileImage != nil {
                            profileImage!
                                .resizable()
                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                .frame(width: 100, height: 100)
                                .padding(.top, 20)
                                .onTapGesture {
                                    self.showImgActionSheet = true
                                }
                        } else {
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .clipShape(Circle())
                                .frame(width: 100, height: 100)
                                .padding(.top, 20)
                                .foregroundColor(.white)
                                .onTapGesture {
                                    self.showImgActionSheet = true
                                }
                        }
                    }
                }
                
                Group {
                    FormField(value: $userName, icon: "person.fill", placeHolder: "Usuario")
                    FormField(value: $email, icon: "envelope.fill", placeHolder: "Correo")
                    FormField(value: $password, icon: "lock.fill", placeHolder: "Contrasena", isSecure: true)
                }
                
                Button(action: signUp) {
                    Text("Inscribirse")
                        .font(.title)
                        .modifier(ButtonModifiers())
                }
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text(alertTitle), message: Text(error), dismissButton: .default(Text("Ok")))
                }
            }
            .padding(.top, 20)
            // Hide the system back button
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: BackButton())
        }
        .padding()
        .padding(.top, 40)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("2")).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
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
}

struct InstagramSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        InstagramSignUpView()
    }
}
