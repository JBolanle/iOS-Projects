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
                            AppetizerListItem(appetizer: appetizer)
                        }
                        .onDelete(perform: order.deleteItems)
                    }
                    .listStyle(PlainListStyle())

                    Button("$\(order.totalCost, specifier: "%.2f") - Place Order", action: {
                        //
                    })
                    .font(.title3)
                    .fontWeight(.semibold)
                    .buttonStyle(.bordered)
                    .controlSize(.large)
                    .buttonBorderShape(.roundedRectangle(radius: 10))
                    .tint(.brandPrimary)
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

#Preview {
    OrderView()
}
