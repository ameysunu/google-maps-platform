//
//  CentresView.swift
//  google-maps-platform
//
//  Created by Amey Sunu on 25/10/2022.
//

import SwiftUI

struct CentresView: View {
    var body: some View {
        List {
            ForEach (healthCentres, id: \.self) { centre in
                NavigationLink(destination: CentresDetailView(centreName: centre.name, address: centre.address, eircode: centre.eircode,latitude: centre.x, longitude: centre.y) ){
                    VStack(alignment: .leading){
                        Text(centre.name)
                        Text(centre.address)
                            .foregroundColor(.gray)
                    }
                }
            }
        }
        .navigationTitle("Health Centres")
    }
}

struct CentresView_Previews: PreviewProvider {
    static var previews: some View {
        CentresView()
    }
}
