//
//  SheetView.swift
//  google-maps-platform
//
//  Created by Amey Sunu on 09/10/2022.
//

import SwiftUI
import Firebase
import PopupView

struct SheetView: View {
    
    @State var showingPopup: Bool = false
    
    var body: some View {
        ZStack(alignment: .leading){
            Color(hex: "231651").ignoresSafeArea()
            VStack(alignment: .leading){
                Button(action:{
                    let firebaseAuth = Auth.auth()
                    do {
                        try firebaseAuth.signOut()
                    } catch let signOutError as NSError {
                        print("Error signing out: %@", signOutError)
                        self.showingPopup = true
                        errorMessage = signOutError.localizedDescription
                    }
                    
                }){
                    Text("Logout")
                        .padding(15)
                        .frame(maxWidth: .infinity)
                        .background(Color(UIColor.systemIndigo))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .padding()
        }
        .popup(isPresented: $showingPopup, type: .floater(verticalPadding: 10.0, useSafeAreaInset: true), position: .top, autohideIn: 2, dragToDismiss: true) {
            VStack{
                Text(errorMessage)
                    .font(.title3)
                    .padding(10)
            }
            .font(.body)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, minHeight: 100.0)
            .background(Color(hex: "ff4d4d"))
            .cornerRadius(20)
            .padding(15)
        }
    }
}

struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        SheetView()
    }
}
