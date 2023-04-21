//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Jumoke Bolanle on 4/19/23.
//

import Foundation

struct ExpenseItem {
    let name: String
    let type: String
    let amount: Double
}

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}
