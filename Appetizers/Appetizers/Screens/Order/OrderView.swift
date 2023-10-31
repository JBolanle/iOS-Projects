//
//  OrderView.swift
//  Appetizers
//
//  Created by Jumoke Bolanle on 10/29/23.
//

import SwiftUI

struct OrderView: View {
    var body: some View {
        NavigationStack {
            Text("Order View")
                .navigationTitle("🧾 Orders")
                .navigationBarTitleDisplayMode(.automatic)
        }
    }
}

#Preview {
    OrderView()
}
