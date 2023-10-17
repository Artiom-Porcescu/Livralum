//
//  MainMenuBtn.swift
//  Livralum
//
//  Created by Artiom Porcescu on 12.10.2023.
//

import SwiftUI

struct MainMenuBtn<Destination: View>: View {
    
    let name: String
    let destination: Destination
    
    var body: some View {
        NavigationLink(destination: destination) {
            Text(name)
                .frame(width: 250, height: 40)
                .font(.system(size: 22, weight: .bold))
                .foregroundColor(Color("authColors"))
                .padding(.vertical, 10)
                .overlay(Capsule()
                                .stroke(Color("authColors"),
                                        lineWidth: 3))
        }
    }
}

#Preview {
    MainMenuBtn(name: "Вход", destination: WelcomeView())
}
