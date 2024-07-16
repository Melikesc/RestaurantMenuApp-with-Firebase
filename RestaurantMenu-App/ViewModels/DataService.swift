//
//  DataService.swift
//  RestaurantMenuApp
//
//  Created by Melike Sultan CAN on 10.07.2024.
//

import Foundation
import FirebaseFirestore

class DataService: ObservableObject {
    private var db = Firestore.firestore()
    
    @Published var categories: [Category] = []
    @Published var menuItems: [MenuItem] = []
    
    init() {
        fetchCategories()
    }
    
    func fetchCategories() {
        db.collection("categories").addSnapshotListener { querySnapshot, error in
            if let error = error {
                print("Error getting documents: \(error)")
                return
            }
            
            if let querySnapshot = querySnapshot {
                self.categories = querySnapshot.documents.compactMap { document -> Category? in
                    let data = document.data()
                    print("Document data: \(data)")
                    
                    let items = data["items"] as? [DocumentReference] ?? []
                    
                    let category = Category(
                        id: document.documentID,
                        name: data["name"] as? String ?? "",
                        items: items,
                        image: data["image"] as? String
                    )
                    print("Fetched category: \(category)")
                    return category
                }
            }
        }
    }
    
    func fetchItems(for category: Category) {
        guard let itemReferences = category.items else {
            print("No items found for category: \(category.name)")
            return
        }
        self.menuItems = [] // Önceki verileri temizle
        for itemRef in itemReferences {
            itemRef.getDocument { document, error in
                if let error = error {
                    print("Error getting document: \(error)")
                    return
                }
                
                if let document = document, document.exists {
                    if let item = try? document.data(as: MenuItem.self) {
                        DispatchQueue.main.async {
                            self.menuItems.append(item)
                            print("Fetched item: \(String(describing: item))")
                        }
                    } else {
                        print("Document data was empty or could not be parsed: \(String(describing: document.data()))")
                    }
                } else {
                    print("Document does not exist: \(String(describing: document))")
                }
            }
        }
    }
}
