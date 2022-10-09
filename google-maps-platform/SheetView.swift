//
//  SheetView.swift
//  google-maps-platform
//
//  Created by Amey Sunu on 09/10/2022.
//

import SwiftUI

struct SheetView: View {
    var body: some View {
        ZStack(alignment: .leading){
            Color(hex: "231651").ignoresSafeArea()
            VStack(alignment: .leading){
                
                Text("Hi there!")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(.bottom, 10)
                
                Text("We just need a couple more information right before we get you started.")
                    .foregroundColor(.white)
                    .padding(.bottom, 20)
                
                MyTextField(username: "", textFieldText: "Name")
                MyTextField(username: "", textFieldText: "Age: dd/mm/yyy")
                Spacer()
                
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
