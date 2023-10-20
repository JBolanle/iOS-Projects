//
//  AirbnbListingsView.swift
//  Airbnb
//
//  Created by Jumoke Bolanle on 10/11/23.
//

import SwiftUI

struct AirbnbListingsView: View {
    @StateObject var viewModel = AirbnbListingsViewViewModel()

    var body: some View {
        NavigationView {
            VStack {
                if viewModel.listings.isEmpty {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                } else {
                    List(viewModel.listings) { listing in
                        NavigationLink(destination: AirbnbDetailView(model: listing), label: {
                            AirbnbListingCardView(model: listing)
                        })
                    }
                }
            }
            .navigationTitle("Airbnb")
        }
        .onAppear {
            viewModel.fetchListings()
        }
    }
}
