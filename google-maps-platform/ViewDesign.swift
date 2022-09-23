//
//  ViewDesign.swift
//  google-maps-platform
//
//  Created by Amey Sunu on 23/09/2022.
//

import SwiftUI

struct MyTextField: View {
    
    @State var username: String
    var textFieldText: String
    
    var body: some View {
        TextField(textFieldText, text: $username)
            .foregroundColor(.white)
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 5.0)
                .stroke(Color.white, lineWidth: 1.0))
            .padding(.bottom, 20)
            .autocapitalization(.none)
    }
}

struct MyPasswordField: View {
    
    @State var password: String
    var textFieldText: String
    
    var body: some View {
        SecureField( textFieldText, text: $password)
            .foregroundColor(.white)
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 5.0)
                .stroke(Color.white, lineWidth: 1.0))
            .padding(.bottom, 20)
            .autocapitalization(.none)

    }
}
