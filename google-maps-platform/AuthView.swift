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
    @State var confirmPassword: String
    @StateObject var keyboardHandler = KeyboardHandler()
    @State var createAccount: Bool = false
    @State var showingPopup = false
    @State var popupText: String
    
    var body: some View {
        ZStack(alignment: .leading){
            Color(hex: "231651").ignoresSafeArea()
            VStack(alignment: .leading, spacing: 10) {
                if showingPopup {
                    ErrorPopView(popupText: popupText)
                } else {
                    Text("Welcome!").font(.largeTitle).foregroundColor(.white)

                    Spacer()
                    if createAccount{
                        HStack{
                            Spacer()
                            Image(uiImage: UIImage(named: "register")!)
                                .resizable()
                                .frame(width: 300, height: 250)
                                .padding()
                            Spacer()
                        }
                        
                        TextField("", text: $username)
                            .placeholder(when: username.isEmpty) {
                                Text("Email").foregroundColor(.gray)
                        }
                            .foregroundColor(.white)
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 5.0)
                                .stroke(Color.white, lineWidth: 1.0))
                            .padding(.bottom, 20)
                            .autocapitalization(.none)
                        
                        SecureField("", text: $password)
                            .placeholder(when: password.isEmpty) {
                                Text("Password").foregroundColor(.gray)
                        }
                            .foregroundColor(.white)
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 5.0)
                                .stroke(Color.white, lineWidth: 1.0))
                            .padding(.bottom, 20)
                            .autocapitalization(.none)
                        
                        SecureField("", text: $confirmPassword)
                            .placeholder(when: confirmPassword.isEmpty) {
                                Text("Confirm Password").foregroundColor(.gray)
                        }
                            .foregroundColor(.white)
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 5.0)
                                .stroke(Color.white, lineWidth: 1.0))
                            .padding(.bottom, 20)
                            .autocapitalization(.none)
                        
                        Button(action:{
                            if(password == confirmPassword){
                                registerUser(email: username, password: password){
                                    (success) -> Void in
                                    if success {
                                        
                                    } else {
                                        self.showingPopup = true
                                        popupText = "error"
                                    }
                                }
                            } else {
                                print("Entered passwords do not match.")
                            }
                        }){
                            Text("Create an account")
                                .padding(15)
                                .frame(maxWidth: .infinity)
                                .background(Color(UIColor.systemIndigo))
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                        
                        
                        Button(action:{
                            self.createAccount = false
                        }){
                            Text("I already have an account")
                                .padding(15)
                                .frame(maxWidth: .infinity)
                                .background(Color(UIColor.systemIndigo))
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                    } else {
                        HStack{
                            Spacer()
                            Image(uiImage: UIImage(named: "welcome")!)
                                .resizable()
                                .frame(width: 300, height: 300)
                                .padding()
                            Spacer()
                        }
                        
                        TextField("", text: $username)
                            .placeholder(when: username.isEmpty) {
                                Text("Email").foregroundColor(.gray)
                        }
                            .foregroundColor(.white)
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 5.0)
                                .stroke(Color.white, lineWidth: 1.0))
                            .padding(.bottom, 20)
                            .autocapitalization(.none)
                        
                        SecureField("", text: $password)
                            .placeholder(when: password.isEmpty) {
                                Text("Password").foregroundColor(.gray)
                        }
                            .foregroundColor(.white)
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 5.0)
                                .stroke(Color.white, lineWidth: 1.0))
                            .padding(.bottom, 20)
                            .autocapitalization(.none)
                        
                        Button(action:{}){
                            Text("Sign-in")
                                .padding(15)
                                .frame(maxWidth: .infinity)
                                .background(Color(UIColor.systemIndigo))
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                        
                        
                        Button(action:{
                            self.createAccount = true
                        }){
                            Text("Create an account")
                                .padding(15)
                                .frame(maxWidth: .infinity)
                                .background(Color(UIColor.systemIndigo))
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                    }
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
        AuthView(username: "Test", password: "Test", confirmPassword: "Test", popupText: "Test")
    }
}
