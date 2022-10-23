//
//  ContentView.swift
//  google-maps-platform
//
//  Created by Amey Sunu on 15/09/2022.
//

import SwiftUI
import FirebaseAuth
import FirebaseCore

struct ContentView: View {
    
    @ObservedObject var authManager = AuthManager()
    
    var body: some View {
        if authManager.isLoggedIn {
            HomeView()
        } else {
            AuthView(username: "", password: "", confirmPassword: "")
        }
    }
}

class AuthManager : ObservableObject {
    @Published var isLoggedIn = false
    
    private var authStateHandle: AuthStateDidChangeListenerHandle?
    
    init() {
        FirebaseApp.configure()
        authStateHandle = Auth.auth().addStateDidChangeListener { _, user in
            self.isLoggedIn = user != nil
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
