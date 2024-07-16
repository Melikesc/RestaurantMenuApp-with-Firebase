//
//  MenuItemsView.swift
//  RestaurantMenuApp
//
//  Created by Melike Sultan CAN on 10.07.2024.
//

import SwiftUI

struct MenuItemsView: View {
    var category: Category
    @ObservedObject var dataService = DataService()
    
    var body: some View {
        
        ZStack {
            
            Color.customBG
                .ignoresSafeArea(.all)
            
            ScrollView {
                LazyVStack {
                    ForEach(dataService.menuItems) { item in
                        HStack {
                            if let url = URL(string: item.image) {
                                AsyncImage(url: url) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 100, height: 100)
                                        .cornerRadius(15)

                                } placeholder: {
                                    ProgressView()
                                }
                            }
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                if let detail = item.detail {
                                    Text(detail)
                                        .font(.subheadline)
                                }
                            }
                            Spacer()
                        }
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                        .padding(.horizontal)
                    }
                }
            }
            .navigationTitle(category.name)
            .onAppear {
                dataService.fetchItems(for: category)
            }
        }
    }
}

#Preview {
    MenuItemsView(category: Category(id: "1", name: "Example", items: nil))
}
