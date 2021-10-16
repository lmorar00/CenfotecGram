//
//  TabButton.swift
//  Instagram
//
//  Created by Luis Mora Rivas on 15/10/21.
//

import SwiftUI

struct TabButton: View {
    var image: String
    
    @Binding var selectedTab: String
    
    var body: some View {
        Button(action: {selectedTab = image}) {
            Image(systemName: "\(image)")
                .foregroundColor(selectedTab == image ? Color("1") : Color.white)
                .padding()
        }
    }
}

struct TabButton_Previews: PreviewProvider {
    @State static var selectedTab = "house.fill"
    static var previews: some View {
        TabButton(image: "", selectedTab: $selectedTab)
    }
}
