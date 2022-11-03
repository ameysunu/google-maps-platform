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
        let camera = GMSCameraPosition.ireland
        
        let mapView = GMSMapView(frame: CGRect.zero, camera: camera)
        
        return mapView
        
    }
    
    func updateUIView(_ uiView: GMSMapView, context: Context) {
        for county in counties {
            let marker : GMSMarker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: county.Lat , longitude: county.Long)
            marker.title = county.CountyName
            marker.map = uiView
        }
    }
    
}

extension GMSCameraPosition  {
    //static var cameraLocation = ireland
    static var ireland = GMSCameraPosition.camera(withLatitude: 53.142400, longitude: -7.692100, zoom: 6)
    static var dublin = GMSCameraPosition.camera(withLatitude: 53.35837, longitude: -6.3233002, zoom: 10)
    static var galway = GMSCameraPosition.camera(withLatitude: 53.270962, longitude: -9.062691, zoom: 6)
    static var cork = GMSCameraPosition.camera(withLatitude: 51.903614, longitude: -8.468399, zoom: 6)
    static var limerick = GMSCameraPosition.camera(withLatitude: 52.668018, longitude: -8.630498, zoom: 6)
    
}
struct GenericMap: UIViewRepresentable {
    
    @State var latitude: CLLocationDegrees
    @State var longitude: CLLocationDegrees
    
    func makeUIView(context: Context) -> GMSMapView {
        let camera = GMSCameraPosition.camera(withLatitude: latitude, longitude: longitude, zoom: 10)
        
        let mapView = GMSMapView(frame: CGRect.zero, camera: camera)
        
        
        return mapView
        
    }
    
    func updateUIView(_ uiView: GMSMapView, context: Context) {
        let marker : GMSMarker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        marker.map = uiView
    }
    
}

struct CentresMap: UIViewRepresentable {
    
    @State var latitude: CLLocationDegrees
    @State var longitude: CLLocationDegrees
    
    @Binding var selectedMarker: GMSMarker?
    
    func makeCoordinator() -> Coordinator {
            return Coordinator(
                owner: self,
                selectedMarker: $selectedMarker)
        }

    
    func makeUIView(context: Context) -> GMSMapView {
        let camera = GMSCameraPosition.camera(withLatitude: latitude, longitude: longitude, zoom: 10)
        
        let mapView = GMSMapView(frame: CGRect.zero, camera: camera)
        
        mapView.delegate = context.coordinator
        
        return mapView
        
    }
    
    func updateUIView(_ uiView: GMSMapView, context: Context) {
        for centre in vaccinationCentres{
            for i in centre.centres {
                let marker : GMSMarker = GMSMarker()
                marker.position = CLLocationCoordinate2D(latitude: i.latitude, longitude: i.longitude)
                marker.title = i.name
                marker.map = uiView
            }
        }
    }
    class Coordinator: NSObject, GMSMapViewDelegate, ObservableObject {

        let owner: CentresMap       // access to owner view members,

        @Binding var selectedMarker: GMSMarker?

        init(
            owner: CentresMap,
            selectedMarker: Binding<GMSMarker?>
        ) {

            self.owner = owner

            _selectedMarker = selectedMarker

        }

        func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {

            print("A marker has been touched")

            self.selectedMarker = marker
            
//            GMSCameraPosition.camera(withTarget: selectedMarker!.position, zoom: 12)
            

            return true

        }

    }
    
}
