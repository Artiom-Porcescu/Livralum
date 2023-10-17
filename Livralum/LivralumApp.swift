//
//  LivralumApp.swift
//  Livralum
//
//  Created by Artiom Porcescu on 20.09.2023.
//

import SwiftUI
import Firebase

@main
struct LivralumApp: App {
    @StateObject var viewModel = AuthVM()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
                .preferredColorScheme(.light)
        }
    }
}
