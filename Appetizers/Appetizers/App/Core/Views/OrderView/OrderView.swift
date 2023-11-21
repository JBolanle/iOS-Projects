//
//  OrderView.swift
//  Appetizers
//
//  Created by Jumoke Bolanle on 10/29/23.
//

import SwiftUI

struct OrderView: View {

    @EnvironmentObject var order: Order

    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    List {
                        ForEach(order.orderItems) { appetizer in
                            AppetizerListCell(appetizer: appetizer)
                        }
                        .onDelete(perform: order.deleteItems)
                    }
                    .listStyle(PlainListStyle())

                    Button("$\(order.totalCost, specifier: "%.2f") - Place Order", action: {
                        //
                    })
                    .modifier(StandardButtonStyle())
                    .padding(.bottom, 25)
                }

                if order.orderItems.isEmpty {
                    EmptyState(imageName: "empty-order", message: "You have no items in your order.\nPlease add an appetizer.")
                }
            }
            .navigationTitle("🧾 Order")
        }
    }

    
}
