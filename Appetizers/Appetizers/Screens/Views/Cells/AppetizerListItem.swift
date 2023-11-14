//
//  AppetizerListItem.swift
//  Appetizers
//
//  Created by Jumoke Bolanle on 10/30/23.
//

import SwiftUI

struct AppetizerListItem: View {
    let appetizer: Appetizer

    var body: some View {
        HStack {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 90)
                .cornerRadius(8)

            VStack(alignment: .leading, spacing: 5) {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                    .fontDesign(.rounded)

                Text(String("$\(appetizer.price)"))
                    .foregroundStyle(.secondary)
                    .fontDesign(.rounded)
                    .fontWeight(.semibold)
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    AppetizerListItem(appetizer: MockData.sampleAppetizer)
}
