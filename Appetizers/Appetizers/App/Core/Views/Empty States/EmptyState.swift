//
//  EmptyOrderView.swift
//  Appetizers
//
//  Created by Jumoke Bolanle on 11/17/23.
//

import SwiftUI

struct EmptyState: View {
    let imageName: String
    let message: String

    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()

            VStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                    .padding(.bottom, 25)

                Text(message)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Color(Color.secondary))
            }
        }
        .offset(y: -25)
    }
}

#Preview {
    EmptyState(imageName: "empty-order", message: "This is our test message.\nMaking it long to test word wrap.")
}
