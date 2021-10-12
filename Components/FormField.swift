//
//  FormField.swift
//  Instagram
//
//  Created by Luis Mora Rivas on 14/9/21.
//

import SwiftUI

struct FormField: View {
    @Binding var value: String
    //Variables
    var icon: String
    var placeHolder: String
    var isSecure = false
    
    var body: some View {
        Group {
            HStack {
                Image(systemName: icon)
                    .padding()
                    .foregroundColor(.white)
                Group {
                    if isSecure {
                        SecureField(placeHolder, text: $value)
                            .padding()
                    } else {
                        TextField(placeHolder, text: $value)
                            .padding()
                    }
                }
                .font(Font.system(size: 20, design: .monospaced))
                .foregroundColor(.black)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                .disableAutocorrection(true)
                .autocapitalization(.none)
            }
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 4)).padding()
        }
    }
}

struct FormField_Previews: PreviewProvider {
    static var previews: some View {
        FormField(value: .constant(""), icon: "", placeHolder: "Usuario", isSecure: false)
    }
}
