//
//  HomeView.swift
//  google-maps-platform
//
//  Created by Amey Sunu on 09/10/2022.
//

import SwiftUI
import GoogleMaps
import CoreLocationUI

struct HomeView: View {
    @State var isSettingsPresented = false
    let scrollViewHeight: CGFloat = 80
    
    static let cities = [
      City(name: "San Francisco", coordinate: CLLocationCoordinate2D(latitude: 37.7576, longitude: -122.4194)),
      City(name: "Seattle", coordinate: CLLocationCoordinate2D(latitude: 47.6131742, longitude: -122.4824903)),
      City(name: "Singapore", coordinate: CLLocationCoordinate2D(latitude: 1.3440852, longitude: 103.6836164)),
      City(name: "Sydney", coordinate: CLLocationCoordinate2D(latitude: -33.8473552, longitude: 150.6511076)),
      City(name: "Tokyo", coordinate: CLLocationCoordinate2D(latitude: 35.6684411, longitude: 139.6004407))
    ]
    
    @State var markers: [GMSMarker] = cities.map {
      let marker = GMSMarker(position: $0.coordinate)
      marker.title = $0.name
      return marker
    }

    
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
                
                GoogleMapsView()
                    .edgesIgnoringSafeArea(.all)
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
