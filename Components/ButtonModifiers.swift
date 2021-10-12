//
//  ButtonModifiers.swift
//  Instagram
//
//  Created by Luis Mora Rivas on 14/9/21.
//

import SwiftUI

struct ButtonModifiers: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .frame(minWidth: 0, maxWidth: .infinity)
            .frame(height: 20)
            .padding()
            .foregroundColor(.white)
            .font(.system(size: 14, weight: .bold))
            .background(Color("3"))
            .cornerRadius(10)
    }
}
