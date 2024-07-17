//
//  MenuItemsView.swift
//  RestaurantMenuApp
//
//  Created by Melike Sultan CAN.
//
import SwiftUI

struct MenuItemsView: View {
    var category: Category
    @ObservedObject var dataService = DataService()
    @State private var selectedItem: MenuItem?
    @State private var showItemDetail = false

    var body: some View {
        ZStack {
            Color.customBG
                .ignoresSafeArea(.all)

            ScrollView {
                LazyVStack {
                    ForEach(dataService.menuItems) { item in
                        Button(action: {
                            selectedItem = item
                            showItemDetail = true
                        }) {
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
                                    Text(String(format: "%.2f ₺", item.price))
                                        .font(.subheadline)
                                }
                                Spacer()
                            }
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(10)
                            .padding(.horizontal)
                        }
                        .sheet(isPresented: $showItemDetail) {
                            if let selectedItem = selectedItem {
                                MenuItemDetailView(menuItem: selectedItem)
                            }
                        }
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
