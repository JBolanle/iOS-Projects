//
//  ContentView.swift
//  Appetizers
//
//  Created by Jumoke Bolanle on 10/29/23.
//

import SwiftUI

struct AppetizerTabView: View {
    @EnvironmentObject var order: Order

    var body: some View {
        TabView {
            AppetizerListView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }

            AccountView()
                .tabItem {
                    Label("Account", systemImage: "person")
                }

            OrderView()
                .tabItem {
                    Label("Order", systemImage: "bag")
                }
                .badge(order.orderItems.count)
        }
        //        .tint(.brandPrimary)
    }
}

#Preview {
    AppetizerTabView()
        .environmentObject(Order())
}
