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
        TextField("", text: $username)
            .placeholder(when: username.isEmpty) {
                Text(textFieldText).foregroundColor(.gray)
        }
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
        SecureField("", text: $password)
            .placeholder(when: password.isEmpty) {
                Text(textFieldText).foregroundColor(.gray)
        }
            .foregroundColor(.white)
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 5.0)
                .stroke(Color.white, lineWidth: 1.0))
            .padding(.bottom, 20)
            .autocapitalization(.none)

    }
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}
