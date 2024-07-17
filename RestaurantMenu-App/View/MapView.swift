//
//  MapView.swift
//  RestaurantMenuApp
//
//  Created by Melike Sultan CAN.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 41.008858969578164, longitude: 28.974044930691004),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: [RestaurantLocation.example]) { location in
            MapMarker(coordinate: location.coordinate, tint: .red)
        }.ignoresSafeArea(.all) 
        .navigationTitle("Konumumuz")
    }
}

struct RestaurantLocation: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
    
    static let example = RestaurantLocation(name: "Las Tapas Restaurant", coordinate: CLLocationCoordinate2D(latitude: 41.008858969578164, longitude: 28.974044930691004)) // Örnek konum
}



#Preview {
    MapView()
}
