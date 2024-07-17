//
//  Category.swift
//  RestaurantMenuApp
//
//  Created by Melike Sultan CAN on 10.07.2024.
//
import Foundation
import FirebaseFirestoreSwift
import FirebaseFirestore

struct Category: Identifiable, Codable {
    @DocumentID var id: String?
    var name: String
    var items: [DocumentReference]?
    var image: String?
}

