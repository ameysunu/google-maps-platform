//
//  Authentication.swift
//  google-maps-platform
//
//  Created by Amey Sunu on 26/09/2022.
//

import Foundation
import FirebaseAuth

var errorMessage: String = ""
typealias success = Bool

func registerUser(email: String, password: String, completion: @escaping (success) -> Void){
    Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
        if (error != nil) {
            print(error!.localizedDescription)
            errorMessage = error!.localizedDescription
            completion(false)
        } else {
            print("account created")
            completion(true)
        }
    }
}

func signInUser(email: String, password: String, completion: @escaping (success) -> Void){
    Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
        if (error != nil) {
            print(error!.localizedDescription)
            errorMessage = error!.localizedDescription
            completion(false)
        } else {
            print("successfully signed in")
            completion(true)
        }
    }
}
