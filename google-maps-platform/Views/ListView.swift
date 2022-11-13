//
//  ListView.swift
//  google-maps-platform
//
//  Created by Amey Sunu on 27/10/2022.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        VStack (alignment: .leading){
            List{
                ForEach(counties, id: \.self){county in
                    NavigationLink(destination: DetailView(CountyName: county.CountyName, PopulationCensus16: county.PopulationCensus16, Lat: county.Lat, Long: county.Long)){
                        Text(county.CountyName)
                            .foregroundColor(.white)
                    }
                }
                .listRowBackground(Color(hex: "231651"))
            }
            .listStyle(.plain)
            .frame(height: 250)
        }
        .font(.body)
        .foregroundColor(.white)
        .frame(maxWidth: .infinity, minHeight: 250.0)
        .background(Color(hex: "231651"))
        .cornerRadius(20)
        .padding(15)
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
