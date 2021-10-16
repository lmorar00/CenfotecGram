//
//  PostCardService.swift
//  Instagram
//
//  Created by Luis Mora Rivas on 15/10/21.
//

import Foundation
import Firebase
import SwiftUI

class PostCardService : ObservableObject {
    @Published var post: PostModel!
    @Published var isLiked = false
    
    func hasLickedPost() {
        isLiked = (post.likes["\(Auth.auth().currentUser!.uid)"] == true) ? true : false
    }
    
    func like() {
        post.likeCount += 1
        isLiked = true
        
        PostService.getPostsUserId(userId: post.ownerId).collection("Posts").document(post.postId).updateData(["likeCount": post.likeCount, "\(Auth.auth().currentUser!.uid)": true])
        
        PostService.allPosts.document(post.postId).updateData(["likeCount": post.likeCount, "\(Auth.auth().currentUser!.uid)": true])
        
        PostService.getTimeLineUserId(userId: post.ownerId).collection("TimeLine").document(post.postId).updateData(["likeCount": post.likeCount, "\(Auth.auth().currentUser!.uid)": true])
    }
    
    func unLike() {
        post.likeCount -= 1
        isLiked = false
        
        PostService.getPostsUserId(userId: post.ownerId).collection("Posts").document(post.postId).updateData(["likeCount": post.likeCount, "\(Auth.auth().currentUser!.uid)": false])
        
        PostService.allPosts.document(post.postId).updateData(["likeCount": post.likeCount, "\(Auth.auth().currentUser!.uid)": false])
        
        PostService.getTimeLineUserId(userId: post.ownerId).collection("TimeLine").document(post.postId).updateData(["likeCount": post.likeCount, "\(Auth.auth().currentUser!.uid)": true])
    }
}
