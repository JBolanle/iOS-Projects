//
//  Order.swift
//  CupcakeCorner
//
//  Created by Jumoke Bolanle on 5/25/23.
//

import SwiftUI

class Order: ObservableObject, Codable {
    static let types = ["Vanilla", "Strawberry", "Red Velvet", "Chocolate", "Banana"]
    
    @Published var types = 0
    @Published var quantity = 0
    
    @Published var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    
    @Published var extraFrosting = false
    @Published var addSprinkles = false
    
    @Published var name = ""
    @Published var streetAddress = ""
    @Published var city = ""
    @Published var zip = ""
    
    var hasValidAddress: Bool {
        if name.isEmpty || name == "" || streetAddress.isEmpty || streetAddress == "" || city.isEmpty || city == "" || zip.isEmpty || zip == "" {
            return false
        }
        
        return true
    }
    
    var cost: Double {
        // $2 per cupcake
        var cost = Double(quantity) * 2
        
        // more complex cakes = more $$$$$
        cost += (Double(types) / 2)
        
        // additional $1 for extra frosting
        if extraFrosting {
            cost += Double(quantity)
        }
        
        // additional $0.5 for extra sprinkles
        if addSprinkles {
            cost += Double(quantity)/2
        }
        
        return cost
    }
    
    enum CodingKeys: CodingKey {
        case types, quantity, extraFrosting, addSprinkles, name, streetAddress, city, zip
    }
    
    func encode(to encoder: Encoder) throws {
        var container  = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(types, forKey: .types)
        try container.encode(quantity, forKey: .quantity)
        
        try container.encode(extraFrosting, forKey: .extraFrosting)
        try container.encode(addSprinkles, forKey: .addSprinkles)
        
        try container.encode(name, forKey: .name)
        try container.encode(streetAddress, forKey: .streetAddress)
        try container.encode(city, forKey: .city)
        try container.encode(zip, forKey: .zip)
    
    }
    
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        types = try container.decode(Int.self, forKey: .types)
        quantity = try container.decode(Int.self, forKey: .quantity)
        
        extraFrosting = try container.decode(Bool.self, forKey: .extraFrosting)
        addSprinkles = try container.decode(Bool.self, forKey: .addSprinkles)
        
        name = try container.decode(String.self, forKey: .name)
        streetAddress = try container.decode(String.self, forKey: .streetAddress)
        city = try container.decode(String.self, forKey: .city)
        zip = try container.decode(String.self, forKey: .zip)
        
    }
    
    init() {}
    
    
}
