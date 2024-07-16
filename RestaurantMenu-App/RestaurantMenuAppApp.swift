//
//  RestaurantMenuAppApp.swift
//  RestaurantMenuApp
//
//  Created by Melike Sultan CAN on 10.07.2024.
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
