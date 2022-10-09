//
//  SheetView.swift
//  google-maps-platform
//
//  Created by Amey Sunu on 09/10/2022.
//

import SwiftUI
import Firebase

struct SheetView: View {
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
    }
}

struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        SheetView()
    }
}
