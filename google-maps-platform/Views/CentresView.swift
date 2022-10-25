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
                Text(centre.name)
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
