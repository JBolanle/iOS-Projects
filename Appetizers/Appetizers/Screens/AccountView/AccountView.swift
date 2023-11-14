//
//  AccountView.swift
//  Appetizers
//
//  Created by Jumoke Bolanle on 10/29/23.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
        NavigationStack {
            Text("Account View")
                .navigationTitle("👤 Account")
                .navigationBarTitleDisplayMode(.automatic)
        }
    }
}

#Preview {
    AccountView()
}
