//
//  Authentication.swift
//  google-maps-platform
//
//  Created by Amey Sunu on 26/09/2022.
//

import Foundation
import Firebase

func registerUser(email: String, password: String){
    Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
        print("account created")
    }
}
