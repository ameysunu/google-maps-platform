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
    @State var vaccineModelData = vaccineData()
    @State var getDirections: Bool = false
    @State var destination: CLLocationCoordinate2D?
    
    var test = ""
    
    var vaccineInformation: VaccCentres? {
        vaccineModelData.vaccineCentres.first {$0.name == markerTitle}
    }
    
    
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
                        CentresMap(latitude: Lat, longitude: Long, selectedMarker: self.$selectedMarker, getRoute: $getDirections, destinationRoute: $destination)
                            .edgesIgnoringSafeArea(.all)
                        
                        if(selectedMarker == nil){
                            CardView(centreTitle: "Select a centre")
                            //Text("Select")
                        } else {
                            ZStack {
                                Color(hex: "231651").ignoresSafeArea()
                                VStack (alignment: .leading){
                                    Text((selectedMarker?.title)!)
                                        .font(.system(size: 20)).bold()
                                    Text(markerAddress)
                                        .foregroundColor(.white)
                                    Text("Appointments: \(appointments)")
                                        .foregroundColor(.white)
                                    Spacer()
                                    Text("[Book appointment at HSE](https://covid19booster.healthservice.ie/hse-self-referral/?flow=booster)")
                                    Button(action:{
                                        print(markerTitle)
                                        print(selectedMarker?.title)
                                        print(selectedMarker?.position)
                                        destination = selectedMarker?.position ?? CLLocationCoordinate2D(latitude: 54.5973, longitude: 5.9301)
                                        print(destination)
                                        if destination != nil {
                                            self.getDirections = true
                                        }
                                    }){
                                        Text("Get Directions")
                                            .padding(15)
                                            .frame(maxWidth: .infinity)
                                            .background(Color(UIColor.systemIndigo))
                                            .foregroundColor(.white)
                                            .cornerRadius(8)
                                    }
                                }
                                .padding()
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .frame(height: 250)
                            .padding()
                            //                            CardView(centreTitle: markerTitle)
                            //                                .onChange(of: changedMarkerTitle, perform: { value in
                            //                                    selectedMarker?.title = value
                            //                                })
                            //                            Text((selectedMarker?.title)!)
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
