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

struct City: Hashable{
    var name: String
    var latitude: Double
    var longitude: Double
    var key: String
}

struct Centres: Codable {

    var type: String
    var properties: Properties
    var geometry: Geometry
    
}

struct Properties: Codable {

    var ObjectId: Int
    var ExtractDate: String
    var VaccinationDate: String
    var VaccineText: String
    var AdditionalDose: Double
    var ImmunoDose: Double
    var AdditionalDoseCum: Double
    var ImmunoDoseCum: Double
    var PerBoosterDose: Double

}

struct Geometry: Codable {
    var coordinates: [Double]
}

struct HealthCentres: Codable, Hashable {
    var name: String
    var address: String
    var eircode: String
    var x : Double
    var y : Double
    
}

var centres: [Centres] = load("COVID-19_HSE_Daily_Booster_Vaccination_Figures.json")
var healthCentres: [HealthCentres] = load("listofhealthcentresinireland.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
