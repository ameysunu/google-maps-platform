//
//  GoogleMapsView.swift
//  google-maps-platform
//
//  Created by Amey Sunu on 19/10/2022.
//

import SwiftUI
import GoogleMaps

let cities = [
    City(name: "Dublin", latitude: 53.350140, longitude: -6.266155, key: "dublin"),
    City(name: "Cork", latitude: 51.903614, longitude: -8.468399, key: "cork"),
    City(name: "Limerick", latitude: 52.668018, longitude: -8.630498, key: "limerick"),
    City(name: "Galway", latitude: 53.270962, longitude: -9.062691, key: "galway")
]

struct GoogleMapsView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> GMSMapView {
        let camera = GMSCameraPosition.cameraLocation
        
        let mapView = GMSMapView(frame: CGRect.zero, camera: camera)
        
        return mapView
        
    }
    
    func updateUIView(_ uiView: GMSMapView, context: Context) {
        for city in cities {
            let marker : GMSMarker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: city.latitude , longitude: city.longitude)
            marker.title = city.name
            marker.snippet = "Welcome to \(city.name)!"
            marker.map = uiView
        }
    }
     
 }

extension GMSCameraPosition  {
    static var cameraLocation = ireland
    static var ireland = GMSCameraPosition.camera(withLatitude: 53.142400, longitude: -7.692100, zoom: 6)
    static var dublin = GMSCameraPosition.camera(withLatitude: 53.35837, longitude: -6.3233002, zoom: 6)
    static var galway = GMSCameraPosition.camera(withLatitude: 53.270962, longitude: -9.062691, zoom: 6)
    static var cork = GMSCameraPosition.camera(withLatitude: 51.903614, longitude: -8.468399, zoom: 6)
    static var limerick = GMSCameraPosition.camera(withLatitude: 52.668018, longitude: -8.630498, zoom: 6)

 }

