//
//  Category.swift
//  RestaurantMenuApp
//
//  Created by Melike Sultan CAN.
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

