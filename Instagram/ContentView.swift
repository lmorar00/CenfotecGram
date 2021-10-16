//
//  ContentView.swift
//  Instagram
//
//  Created by Luis Mora Rivas on 14/9/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var session: SessionStore
    
    var body: some View {
        Group{
            if (session.session != nil) {
                InstagramHomeView()
            } else {
                InstagramSignInView()
            }
        }.onAppear(perform: listen)
    }
    
    
    // Method or Functions
    func listen() {
        session.listen()
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
