//
//  MenuItem.swift
//  RestaurantMenuApp
//
//  Created by Melike Sultan CAN.
//

import Foundation
import FirebaseFirestoreSwift


struct MenuItem: Identifiable, Codable {
    @DocumentID var id: String?
    var name: String
    var image: String
    var detail: String?
    var price: Double
}
