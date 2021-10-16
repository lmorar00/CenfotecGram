//
//  UserModel.swift
//  Instagram
//
//  Created by Luis Mora Rivas on 12/10/21.
//

import Foundation

struct UserModel: Encodable, Decodable{
    var uid: String
    var email: String
    var profileImageUrl: String
    var userName: String
    var searchName: [String]
    var bio: String
}
