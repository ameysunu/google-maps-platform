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
    
    var body: some View {
        ZStack{
            Color(hex: "231651").ignoresSafeArea()
            VStack(alignment: .leading) {
                Text(CountyName)
                    .font(.title)
                    .foregroundColor(.white)
                Text("Population: \(PopulationCensus16)")
                    .foregroundColor(.white)
                GenericMap(latitude: Lat, longitude: Long)
                Spacer()
            }
            .padding()
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(CountyName: "Test", PopulationCensus16: 234, Lat: 23.1, Long: 15.5)
    }
}
