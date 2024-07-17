//
//  DataService.swift
//  RestaurantMenuApp
//
//  Created by Melike Sultan CAN.
//
import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class DataService: ObservableObject {
    private var db = Firestore.firestore()
    
    @Published var categories: [Category] = []
    @Published var menuItems: [MenuItem] = []
    
    init() {
        fetchCategories()
    }
    
    func fetchCategories() {
        db.collection("categories").getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
                return
            }
            
            if let querySnapshot = querySnapshot {
                self.categories = querySnapshot.documents.compactMap { document -> Category? in
                    try? document.data(as: Category.self)
                }
            }
        }
    }
    
    func fetchItems(for category: Category) {
        guard let itemReferences = category.items else {
            print("No items found for category: \(category.name)")
            return
        }
        
        let dispatchGroup = DispatchGroup()
        var fetchedItems: [MenuItem] = []
        
        for itemRef in itemReferences {
            dispatchGroup.enter()
            itemRef.getDocument { document, error in
                if let error = error {
                    print("Error getting document: \(error)")
                } else if let document = document, document.exists, let item = try? document.data(as: MenuItem.self) {
                    fetchedItems.append(item)
                }
                dispatchGroup.leave()
            }
        }
        
        dispatchGroup.notify(queue: .main) {
            self.menuItems = fetchedItems
            print("All items fetched: \(self.menuItems.count) items")
        }
    }
}
