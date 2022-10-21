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
    let scrollViewHeight: CGFloat = 80
    @State var welcomeScreen: Bool = true
    
    var body: some View {
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
                }
                .padding()
                
                ZStack(alignment: .bottomTrailing){
                    GoogleMapsView()
                        .edgesIgnoringSafeArea(.all)
                    
                }
                
                //                Text("Hello Ireland!")
                //                    .foregroundColor(.white)
                //                    .fontWeight(.bold)
                //                    .font(.title)
                //                    .padding()
                //
                //                    ForEach(cities,id: \.self) { city in
                //                        Button(action: {
                //                            print(city.name)
                //                        }) {
                //                            Text(city.name ?? "")
                //                                .padding()
                //                        }
                //                    }
            }
        }
        .sheet(isPresented: $isSettingsPresented) {
            SheetView()
        }
        .navigationBarBackButtonHidden(true)
        .popup(isPresented: $welcomeScreen, position: .top) {
            VStack {
                Text("Hello Ireland!")
                    .foregroundColor(.indigo)
                    .fontWeight(.bold)
                    .font(.title)
                    .padding(10)
                
                Text("Select your current city")
                    .foregroundColor(.indigo)
                    .padding(10)
                HStack{
                    ForEach(cities, id: \.self){city in
                        Button(action:{
                            print(city.name)
                        }){
                            Text(city.name)
                                .foregroundColor(.white)
                                .background(.indigo)
                        }
                    }
                }
            }
            .font(.body)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, minHeight: 100.0)
            .background(.white)
            .cornerRadius(20)
            .padding(15)
        }

    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
