//
//  CentresDetailView.swift
//  google-maps-platform
//
//  Created by Amey Sunu on 25/10/2022.
//

import SwiftUI

struct CentresDetailView: View {
   
    @State var centreName: String
    @State var address: String
    @State var eircode: String
    @State var latitude: Double
    @State var longitude: Double
    
    var body: some View {
        VStack(alignment: .leading){
            Text(centreName)
                .font(.title)
            Text("\(address) \(eircode)")
            GenericMap(latitude: latitude, longitude: longitude)
                .frame(height: 250)
            Spacer()
        }
        .padding()
    }
}

