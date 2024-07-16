//
//  HomeContentView.swift
//  RestaurantMenuApp
//
//  Created by Melike Sultan CAN on 10.07.2024.
//

import SwiftUI

struct HomeContentView: View {
    @ObservedObject var dataService = DataService()
    @State private var selectedCategory: Category?
    
    var body: some View {
            
            NavigationView {
                
                ZStack {
                    Color.customBG
                        .edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                        ForEach(dataService.categories) { category in
                            NavigationLink(destination: MenuItemsView(category: category)) {
                                VStack {
                                    if let imageUrl = category.image, let url = URL(string: imageUrl) {
                                        AsyncImage(url: url) { image in
                                            image
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(height: 100)
                                        } placeholder: {
                                            ProgressView()
                                        }
                                    } else {
                                        Image(systemName: "photo") // Yer tutucu resim
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(height: 100)
                                    }
                                    Text(category.name)
                                        .font(.headline)
                                }
                                .padding()
                                .background(Color.gray.opacity(0.3))
                                .cornerRadius(10)
                            }
                        }
                    }
                    .padding()
                }
                .navigationTitle("Kategoriler")
            }
            .onAppear {
                dataService.fetchCategories()
            }
        }
    }
}

#Preview {
    HomeContentView()
}
