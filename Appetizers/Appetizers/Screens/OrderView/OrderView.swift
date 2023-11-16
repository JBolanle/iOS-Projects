//
//  OrderView.swift
//  Appetizers
//
//  Created by Jumoke Bolanle on 10/29/23.
//

import SwiftUI

struct OrderView: View {
    let appetizer: Appetizer
    @State private var orderItems = MockData.orderItems

    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(orderItems) { appetizer in
                        AppetizerListItem(appetizer: appetizer)
                    }
                    .onDelete(perform: deleteItems)
                }
                .listStyle(PlainListStyle())

                Button("$??? - Place Order", action: {
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
            .navigationTitle("🧾 Order")
        }
    }

    func deleteItems(at offsets: IndexSet) {
        orderItems.remove(atOffsets: offsets)
    }
}

#Preview {
    OrderView(appetizer: MockData.sampleAppetizer)
}
