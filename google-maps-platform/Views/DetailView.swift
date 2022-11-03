//
//  DetailView.swift
//  google-maps-platform
//
//  Created by Amey Sunu on 02/11/2022.
//

import SwiftUI
import GoogleMaps

struct DetailView: View {
    @State var CountyName: String
    @State var PopulationCensus16: Int
    @State var Lat: Double
    @State var Long: Double
    @State var centreExists: Bool = false
    
    @State var selectedMarker: GMSMarker?

    var body: some View {
        GeometryReader { geometry in
            Color(hex: "231651").edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading) {
                VStack(alignment: .leading){
                    Text(CountyName)
                        .font(.title)
                        .foregroundColor(.white)
                    Text("Population: \(PopulationCensus16)")
                        .foregroundColor(.white)
                }
                .padding()
                if centreExists {
                    ZStack(alignment: .bottomTrailing){
                        CentresMap(latitude: Lat, longitude: Long, selectedMarker: self.$selectedMarker)
                            .edgesIgnoringSafeArea(.all)
                        
                        if(selectedMarker == nil){
                            CardView(centreTitle: "Select a centre")
                            //Text("Select")
                        } else {
                            CardView(centreTitle: (selectedMarker?.title)!)
                            Text((selectedMarker?.title)!)
                        }
                    }
                    
                } else {
                    Text("No vaccination centres found for this location.")
                }
            }
        }
        
        .onLoad{
//           for county in counties {
//            for centres in vaccinationCentres {
//                  if(county.CountyName == centres.name){
//                    print(county.CountyName)
//                    print(centres.name)
//                       self.centreExists = true
//                } else {
//                     print("false")
//                       print(county.CountyName)
//                    print(centres.name)
//                 }
//               }
//          }
            if (CountyName == "Cork" || CountyName == "Dublin"){
                self.centreExists = true
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(CountyName: "Ssds", PopulationCensus16: 3432, Lat: 12.23, Long: 23.12)
    }
}
