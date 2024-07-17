//
//  HomeView.swift
//  RestaurantMenuApp
//
//  Created by Melike Sultan CAN on 10.07.2024.
//

import SwiftUI
struct HomeView: View {
    
    var body: some View {
        TabView{
            HomeContentView()
                .tabItem {
                    Label("Anasayfa", systemImage: "house")
                }
            MapView()
                .tabItem {
                    Label("Yerimiz", systemImage: "map")
                }
            InfoView()
                .tabItem {
                    Label("Biz Kimiz?", systemImage: "info.circle")
                }
        }    }
    
}

    

#Preview {
    HomeView()
}
