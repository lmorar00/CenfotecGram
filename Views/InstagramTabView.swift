//
//  InstagramTabView.swift
//  Instagram
//
//  Created by Luis Mora Rivas on 15/10/21.
//

import SwiftUI

struct InstagramTabView: View {
    //Variables
    var tabs = ["house.fill", "magnifyingglass", "camera.viewfinder", "heart.fill", "person.fill"]
    
    // States Variables
    @State var selectedTab = "house.fill"
    @State var edge = UIApplication.shared.windows.first?.safeAreaInsets
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            
            NavigationView {
                TabView(selection: $selectedTab) {
                    InstagramMain()
                        .tag("house.fill")
                    InstagramSearch()
                        .tag("magnifyingglass")
                    InstagramPost()
                        .tag("camera.viewfinder")
                    InstagramNotifications()
                        .tag("heart.fill")
                    InstagramProfile()
                        .tag("person.fill")
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .ignoresSafeArea(.all, edges: .bottom)
            
            HStack(spacing: 0) {
                ForEach(tabs, id: \.self) { image in
                    TabButton(image: image, selectedTab: $selectedTab)
                    
                    if (image != tabs.last) {
                        Spacer(minLength: 0)
                    }
                }
            }
            .padding(.horizontal, 25)
            .padding(.vertical, 5)
            .background(Color("3"))
            .clipShape(Capsule())
            .shadow(color: Color.black.opacity(0.15), radius: 5, x: 5, y: 5)
            .shadow(color: Color.black.opacity(0.15), radius: 5, x: -5, y: -5)
            .padding(.horizontal)
            .padding(.bottom, edge!.bottom == 0 ? 20 : 0)
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .background(Color.black.opacity(0.05).ignoresSafeArea(.all, edges: .all))
        
    }
}

