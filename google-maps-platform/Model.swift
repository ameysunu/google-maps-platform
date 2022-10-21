//
//  Model.swift
//  google-maps-platform
//
//  Created by Amey Sunu on 09/10/2022.
//

import SwiftUI
import CoreLocation

struct AlertItem: Identifiable {
    var id = UUID()
    var title: Text
    var message: Text
    var dismissButton: Alert.Button
}

struct City {
    var name: String
    var latitude: Double
    var longitude: Double
}
