//
//  ContentView.swift
//  google-maps-platform
//
//  Created by Amey Sunu on 15/09/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        AuthView(username: "", password: "", confirmPassword: "", popupText: "")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
