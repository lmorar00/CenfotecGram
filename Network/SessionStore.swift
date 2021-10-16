//
//  SessionStore.swift
//  Instagram
//
//  Created by Luis Mora Rivas on 14/10/21.
//

import Foundation
import Combine
import Firebase
import FirebaseAuth

class SessionStore: ObservableObject {
    // Variables
    var didChange = PassthroughSubject<SessionStore, Never>()
    @Published var session: UserModel? {didSet {self.didChange.send(self)}}
    var handle: AuthStateDidChangeListenerHandle?
    
    func listen() {
        handle = Auth.auth().addStateDidChangeListener({
            (auth, user) in
            
            if let user = user {
                let firestoreUserId = AuthService.getUserId(userId: user.uid)
                firestoreUserId.getDocument{
                    (document, Error) in
                    if let dict = document?.data() {
                        guard let decoderUser = try? UserModel.init(fromDictionary: dict) else { return }
                        self.session = decoderUser
                    }
                }
            }
            else {
                self.session = nil
            }
        })
        
    }
    
    func logout() {
        do {
            try Auth.auth().signOut()
            self.session = nil
        } catch {
            
        }
    }
    
    func unbind() {
        if let handle = handle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }
    
    deinit {
        unbind()
    }
}
