//
//  AuthVM.swift
//  Livralum
//
//  Created by Artiom Porcescu on 12.10.2023.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

@MainActor
class AuthVM: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    init() {
        self.userSession = Auth.auth().currentUser //check if loggedin, will keep user loggedin
    }
    
    func signIn(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
        } catch {
            print("Log In fail - \(error.localizedDescription)")
        }
    }
    
    func createUser(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = User(id: result.user.uid, email: email)
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
        } catch {
            print("Creation of user failure - \(error.localizedDescription)")
        }
    }
    
//    func signOut() {
//        
//    }
    
    func fetchUser() async {
        
    }
}
