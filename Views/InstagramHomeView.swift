//
//  InstagramHomeView.swift
//  Instagram
//
//  Created by Luis Mora Rivas on 14/10/21.
//

import SwiftUI

struct InstagramHomeView: View {
    //@EnvironmentObject var session: SessionStore
    
    var body: some View {
        VStack {
            /*Text("Home View")
            Button(action: session.logout) {
                Text("Cerrar Sesion")
                    .font(.title)
                    .modifier(ButtonModifiers())
            }*/
            InstagramTabView()
                .navigationTitle("")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarHidden(true)
        }
    }
}



