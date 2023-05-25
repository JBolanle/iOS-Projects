//
//  Order.swift
//  CupcakeCorner
//
//  Created by Jumoke Bolanle on 5/25/23.
//

import SwiftUI

class Order: ObservableObject {
    static let type = ["Vanilla", "Strawberry", "Red Velvet", "Chocolate", "Banana"]
    
    @Published var type = 0
    @Published var quantity = 0
    
    @Published var specialRequestEnabled = false
    @Published var extraFrosting = false
    @Published var addSprinkles = false
}
