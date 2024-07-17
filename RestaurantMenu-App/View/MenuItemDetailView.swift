//
//  MenuItemDetailView.swift
//  RestaurantMenuApp
//
//  Created by Melike Sultan CAN on 10.07.2024.
//

import SwiftUI

struct MenuItemDetailView: View {
    var menuItem: MenuItem
    
    var body: some View {
        
        ZStack {
            Color.customBG
                .ignoresSafeArea(.all)
            
            VStack(spacing: 20) {
                if let url = URL(string: menuItem.image) {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 250, height: 250)
                            .cornerRadius(30)
                    } placeholder: {
                        ProgressView()
                    }
                }
                Text(menuItem.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                if let detail = menuItem.detail {
                    Text(detail)
                        .font(.body)
                        .padding(.top)
                }
                
                HStack {
                   Text(String(format: "%.2f ₺", menuItem.price))
                       .font(.title2)
                       .foregroundColor(.gray)
                   Spacer()
               }
               .padding(.horizontal)
                
               Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    MenuItemDetailView(menuItem: MenuItem(id: "1", name: "Example", image: "https://example.com/image.jpg", detail: "Delicious food item", price: 49.99))
}
