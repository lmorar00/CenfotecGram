//
//  BackButton.swift
//  Instagram
//
//  Created by Luis Mora Rivas on 15/9/21.
//

import SwiftUI

struct BackButton: View {
   @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
   
   var body: some View {
    Button(action: {
        self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "chevron.backward") // set image here
                .aspectRatio(contentMode: .fit)
                    .foregroundColor(.white)
                Text("Atrás")
                    .foregroundColor(.white)
            }
        }
   }
}


struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton()
    }
}
