//
//  google_maps_platformApp.swift
//  google-maps-platform
//
//  Created by Amey Sunu on 15/09/2022.
//

import SwiftUI
import FirebaseCore
import GoogleMaps

//class AppDelegate: NSObject, UIApplicationDelegate {
//  func application(_ application: UIApplication,
//                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//    FirebaseApp.configure()
//
//    return true
//  }
//}

let googleMapsAPIkey = "AIzaSyBoFTC3Kx1zjPwioogYYhU7dsB55DD087g"

@main
struct google_maps_platformApp: App {
//    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    init(){
        GMSServices.provideAPIKey(googleMapsAPIkey)
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
