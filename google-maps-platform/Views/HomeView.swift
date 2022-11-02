//
//  HomeView.swift
//  google-maps-platform
//
//  Created by Amey Sunu on 09/10/2022.
//

import SwiftUI
import GoogleMaps
import CoreLocationUI
import ExytePopupView

struct HomeView: View {
    
    @State var isSettingsPresented = false
    @State var centresShow = false
    @State var welcomeScreen = true
    
    init() {
        print(counties)
    }
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color(hex: "231651").ignoresSafeArea()
                VStack(alignment: .leading, spacing: 10) {
                    HStack{
                        Button(action:{
                            self.isSettingsPresented = true
                        }){
                            Image(systemName: "list.dash")
                                .foregroundColor(.white)
                        }
                        Spacer()
                        NavigationLink(destination: CentresView(), isActive: $centresShow){
                            
                        }
                        Button(action:{
                            self.centresShow = true
                        }){
                            Text("Centres")
                        }
                    }
                    .padding()
                                        
                    ZStack(alignment: .bottomTrailing){
                        GoogleMapsView()
                            .edgesIgnoringSafeArea(.all)
                        ListView()
                        
                    }
                }
            }
            .sheet(isPresented: $isSettingsPresented) {
                SheetView()
            }
        }
        .navigationBarBackButtonHidden(true)
//        .popup(isPresented: $welcomeScreen, position: .top) {
//            VStack {
//                Text("Hello Ireland! Choose your county to get started.")
//                    .font(.title)
//                    .foregroundColor(.white)
//                    .padding()
//            }
//            .font(.body)
//            .foregroundColor(.white)
//            .frame(maxWidth: .infinity, minHeight: 100.0)
//            .background(Color(hex: "231651"))
//            .cornerRadius(20)
//            .padding(15)
//        }

    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
