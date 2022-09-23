//
//  AuthView.swift
//  google-maps-platform
//
//  Created by Amey Sunu on 23/09/2022.
//

import SwiftUI

struct AuthView: View {
    
    @State var username: String
    @State var password: String
    
    var body: some View {
        ZStack(alignment: .leading){
            Color(hex: "231651").ignoresSafeArea()
            VStack(alignment: .leading, spacing: 10) {
                Text("Hi There!").font(.largeTitle).foregroundColor(.white)
                
                Spacer()
                
                MyTextField(username: username, textFieldText: "Email")
                MyPasswordField(password: password, textFieldText: "Password")
                
                Button(action:{}){
                    Text("Create an account")
                        .padding(15)
                        .frame(maxWidth: .infinity)
                        .background(Color(UIColor.systemIndigo))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .frame(
                  minWidth: 0,
                  maxWidth: .infinity,
                  minHeight: 0,
                  maxHeight: .infinity,
                  alignment: .topLeading
                )
            .padding(15)
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView(username: "Test", password: "Test")
    }
}
