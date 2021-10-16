//
//  ProfileHeader.swift
//  Instagram
//
//  Created by Luis Mora Rivas on 15/10/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProfileHeader: View {
    // Variables
    var user: UserModel?
    var postsCount: Int
    @Binding var following: Int
    @Binding var followers: Int
    
    var body: some View {
        HStack {
            VStack {
                if (user != nil) {
                    WebImage(url: URL(string: user!.profileImageUrl)!)
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .frame(width: 100, height: 100, alignment: .trailing)
                        .padding(.leading)
                } else {
                    Color.init(red: 0.9, green: 0.9, blue: 0.9)
                        .frame(width: 100, height: 100, alignment: .trailing)
                        .padding(.leading)
                }
                
                if (self.user == nil) { Text("") }
                else {
                    Text(user!.userName)
                        .font(.headline)
                        .bold()
                        .padding(.leading)
                }
            }
            
            VStack {
                HStack {
                    VStack {
                        Text("\(postsCount)")
                            .font(.title)
                            .bold()
                        Text("Publicaciones")
                            .font(.footnote)
                            .bold()
                    }
                    .padding(.top, 5)
                    
                    Spacer()
                    
                    VStack {
                        Text("\(self.followers)")
                            .font(.title)
                            .bold()
                        Text("Seguidores")
                            .font(.footnote)
                            .bold()
                        
                    }
                    .padding(.top, 5)
                    
                    Spacer()
                    
                    VStack {
                        Text("\(self.following)")
                            .font(.title)
                            .bold()
                        Text("Seguidos")
                            .font(.footnote)
                            .bold()
                        
                    }
                    .padding(.top, 5)
                    
                    Spacer()
                }
            }
        }
    }
}

struct ProfileHeader_Previews: PreviewProvider {
    @State(initialValue: 0) var followers: Int
    @State(initialValue: 0) var following: Int
    static var previews: some View {
        ProfileHeader(postsCount: 1, following: .constant(0), followers: .constant(0))
    }
}
