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
//                Text("Hello there!")
//                    .foregroundColor(.indigo)
//                    .fontWeight(.bold)
//                    .font(.title)
//                    .padding(10)
//
//                Text("Choose your current city. We are currently only in the below available cities.")
//                    .foregroundColor(.indigo)
//                    .padding(10)
//
//                List{
//                    ForEach(cities, id: \.self){city in
//                        Button(action:{
//                            print(city.name)
//                        }){
//                            Text(city.name)
//                                .foregroundColor(.indigo)
//                        }
//                    }
//                    .listRowBackground(Color.white)
//                }
//                .listStyle(.plain)
//                .frame(height: 170)
//            }
//            .font(.body)
//            .foregroundColor(.white)
//            .frame(maxWidth: .infinity, minHeight: 100.0)
//            .background(.white)
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
