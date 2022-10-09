//
//  HomeView.swift
//  google-maps-platform
//
//  Created by Amey Sunu on 09/10/2022.
//

import SwiftUI

struct HomeView: View {
    @State var isSettingsPresented = false
    var body: some View {
        ZStack{
            Color(hex: "231651").ignoresSafeArea()
            VStack(alignment: .leading, spacing: 10) {
                Button(action:{
                    self.isSettingsPresented = true
                }){
                    Image(systemName: "list.dash")
                        .foregroundColor(.white)
                }
                .padding()
                Spacer()
            }
        }
        .sheet(isPresented: $isSettingsPresented) {
            SheetView()
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
