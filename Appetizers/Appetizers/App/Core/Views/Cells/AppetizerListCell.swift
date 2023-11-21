//
//  AppetizerListItem.swift
//  Appetizers
//
//  Created by Jumoke Bolanle on 10/30/23.
//

import SwiftUI

struct AppetizerListCell: View {
    let appetizer: Appetizer
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: appetizer.imageURL)) { image in
                image
                    .cellImageStyle()
            } placeholder: {
                Image("food-placeholder")
                    .cellImageStyle()
            }
            
            
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
    AppetizerListCell(appetizer: MockData.sampleAppetizer)
}
