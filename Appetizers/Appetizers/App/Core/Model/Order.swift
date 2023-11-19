//
//  Order.swift
//  Appetizers
//
//  Created by Jumoke Bolanle on 11/17/23.
//

import SwiftUI

final class Order: ObservableObject {
    @Published var orderItems: [Appetizer] = []

    var totalCost: Double {
        orderItems.reduce(0) { $0 + $1.price }
    }


    func add(_ appetizer: Appetizer) {
        orderItems.append(appetizer)
    }

    func deleteItems(at offsets: IndexSet) {
        orderItems.remove(atOffsets: offsets)
    }
}
