//
//  InstagramMain.swift
//  Instagram
//
//  Created by Luis Mora Rivas on 15/10/21.
//

import SwiftUI
import FirebaseAuth

struct InstagramMain: View {
    @EnvironmentObject var session: SessionStore
    @ObservedObject var profileService = ProfileService()
    
    var body: some View {
        if (self.session.session != nil) {
            ScrollView {
                VStack {
                    ForEach(self.profileService.posts, id:\.postId) {
                        (post) in
                        PostCardImage(post: post)
                        
                        PostCard(post: post)
                    }
                }
            }
            .navigationTitle("")
            .navigationBarHidden(true)
            .onAppear {
                
                self.profileService.loadUserPosts(userId: Auth.auth().currentUser!.uid)
                
            }
        }
    }
}

struct InstagramMain_Previews: PreviewProvider {
    static var previews: some View {
        InstagramMain()
    }
}
