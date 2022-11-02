//
//  DetailView.swift
//  google-maps-platform
//
//  Created by Amey Sunu on 02/11/2022.
//

import SwiftUI

struct DetailView: View {
    @State var CountyName: String
    @State var PopulationCensus16: Int
    @State var Lat: Double
    @State var Long: Double
    @State var centreExists: Bool = false

    var body: some View {
        ZStack{
            Color(hex: "231651").ignoresSafeArea()
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
                    CentresMap(latitude: Lat, longitude: Long)
                        .edgesIgnoringSafeArea(.all)
                } else {
                    Text("No vaccination centres found for this location.")
                }
                Spacer()
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
