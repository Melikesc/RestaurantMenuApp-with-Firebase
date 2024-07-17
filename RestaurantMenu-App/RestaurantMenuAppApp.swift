//
//  RestaurantMenuAppApp.swift
//  RestaurantMenuApp
//
//  Created by Melike Sultan CAN.
//
import FirebaseCore
import SwiftUI

@main
struct RestaurantMenuAppApp: App {
    
    // Uygulama başlatıldığında Firebase yapılandırması yapılır
       init(){
           FirebaseApp.configure()
       }
    
    var body: some Scene {
        WindowGroup {
            WelcomeView()
        }
    }
}
