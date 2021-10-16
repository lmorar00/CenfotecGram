//
//  NoPosts.swift
//  Instagram
//
//  Created by Luis Mora Rivas on 16/10/21.
//

import SwiftUI

struct NoPosts: View {
    var body: some View {
        VStack{
            Image(systemName: "photo.fill")
                .resizable()
                .frame(width: 200, height: 150)
                .foregroundColor(Color("3"))
            
            Text("Publicaciones tuyas")
                .font(.largeTitle)
                .bold()
                .padding()
            
            Text("Cuando haga publicaciones van aparecer aquí")
                .foregroundColor(.gray)
        }
    }
}

struct NoPosts_Previews: PreviewProvider {
    static var previews: some View {
        NoPosts()
    }
}
