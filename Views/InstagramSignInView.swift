//
//  InstagramSignInView.swift
//  Instagram
//
//  Created by Luis Mora Rivas on 14/9/21.
//

import SwiftUI

struct InstagramSignInView: View {
    //State variables
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Image(systemName: "camera")
                    .font(.system(size: 60, weight: .black, design: .monospaced))
                    .foregroundColor(Color(.white))
                
                VStack(alignment: .center) {
                    Text("Bienvenido de Vuelta")
                        .font(.system(size: 32, weight: .heavy))
                        .foregroundColor(.white)
                    Text("Inicie sesión para continuar")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.white)
                }
                FormField(value: $email, icon: "envelope.fill", placeHolder: "Correo")
                FormField(value: $password, icon: "lock.fill", placeHolder: "Contrasena", isSecure: true)
                
                Button(action: {}) {
                    Text("Inicio Sesión")
                        .font(.title)
                        .modifier(ButtonModifiers())
                }
                
                HStack{
                    Text("Nuevo?")
                        .foregroundColor(.white)
                    NavigationLink(
                        destination: InstagramSignUpView())
                    {
                        Text("Crear un Usuario.")
                            .font(.system(size:20, weight: .semibold))
                            .foregroundColor(.white)
                    }
                }
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("2")).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        }
        
    }
}


struct InstagramSignInView_Previews: PreviewProvider {
    static var previews: some View {
        InstagramSignInView()
    }
}

