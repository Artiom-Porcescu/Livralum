//
//  ContentView.swift
//  Livralum
//
//  Created by Artiom Porcescu on 13.10.2023.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel: AuthVM
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                Homepage()
            } else {
                WelcomeView()
            }
        }
    }
}

#Preview {
    ContentView()
}
