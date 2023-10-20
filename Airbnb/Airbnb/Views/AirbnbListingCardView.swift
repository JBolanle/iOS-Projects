//
//  AirbnbListingCardView.swift
//  Airbnb
//
//  Created by Jumoke Bolanle on 10/11/23.
//

import SwiftUI

struct AirbnbListingCardView: View {
    let model: AirbnbListing

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: model.thumbnail_url ?? ""))
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .scaledToFit()
                .clipped()


            VStack {
                Text(model.name ?? "Listing")
                    .lineLimit(1)
                    .font(.title2)
                    .bold()

                Text(model.description ?? "Descriptions")
                    .foregroundColor(Color(.secondaryLabel))
                    .lineLimit(3)
                    .font(.body)
            }


        }
    }
}
