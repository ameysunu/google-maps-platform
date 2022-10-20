//
//  GoogleMapsView.swift
//  google-maps-platform
//
//  Created by Amey Sunu on 19/10/2022.
//

import SwiftUI
import GoogleMaps


struct GoogleMapsView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> GMSMapView {
        let camera = GMSCameraPosition.dublin
        
        let mapView = GMSMapView(frame: CGRect.zero, camera: camera)
        
        return mapView
        
    }
    
    func updateUIView(_ uiView: GMSMapView, context: Context) {
        
    }
     
 }

extension GMSCameraPosition  {
    static var currentLocation = GMSCameraPosition.camera(withLatitude: 51.507, longitude: 0, zoom: 10)
    static var london = GMSCameraPosition.camera(withLatitude: 51.507, longitude: 0, zoom: 10)
    static var dublin = GMSCameraPosition.camera(withLatitude: 53.35837, longitude: -6.3233002, zoom: 10)
 }

