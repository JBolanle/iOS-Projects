//
//  Appetizer.swift
//  Appetizers
//
//  Created by Jumoke Bolanle on 10/29/23.
//

import Foundation

struct Appetizer: Decodable, Identifiable {
    var id: Int

    let name: String
    let description: String
    let calories: Int
    let protein: Int
    let carbs: Int
    let price: Double
    let imageURL: String
}

struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}

struct MockData {
    static let sampleAppetizer = Appetizer(id: 001, name: "Test Appetizer", description: "This is the test description", calories: 400, protein: 60, carbs: 20, price: 14.99, imageURL: "Asian Flank Steak")

    static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer]
}
