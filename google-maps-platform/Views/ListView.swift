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
            Text("Hello Ireland! Choose your county to get started.")
                .font(.title)
                .foregroundColor(.white)
                .padding()
            
            List{
                ForEach(counties, id: \.self){county in
                    Button(action:{
                        print(county.CountyName)
                    }){
                        Text(county.CountyName)
                            .foregroundColor(.white)
                    }
                }
                .listRowBackground(Color(hex: "231651"))
            }
            .listStyle(.plain)
            .frame(height: 200)
        }
        .font(.body)
        .foregroundColor(.white)
        .frame(maxWidth: .infinity, minHeight: 300.0)
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
