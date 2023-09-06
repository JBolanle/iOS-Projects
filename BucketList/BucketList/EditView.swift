//
//  EditView.swift
//  BucketList
//
//  Created by Jumoke Bolanle on 8/14/23.
//

import SwiftUI

struct EditView: View {
    @StateObject private var viewModel = ViewModel()

    @Environment(\.dismiss) var dismiss


    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Place name", text: $viewModel.name)
                    TextField("Description", text: $viewModel.description)
                }
                Section ("Nearby...") {
                    switch .loadingState {
                    case .loading:
                        Text("Loading...")
                    case .loaded:
                        ForEach(viewModel.pages, id: \.pageid) { page in
                            Text(page.title)
                                .font(.headline)
                            + Text(": ") +
                            Text(page.description)
                                .italic()
                        }
                    case .failed:
                        Text("Please try again later.")
                    }
                }
            }
            .navigationTitle("Place details")
            .toolbar {
                Button("Save") {
                    var newLocation = viewModel.location
                    newLocation.id = UUID()
                    newLocation.name = viewModel.name
                    newLocation.description = viewModel.description

                    viewModel.onSave(newLocation)
                    dismiss()
                }
            }
            .task {
                await viewModel.fetchNearbyPlaces()
            }
        }
    }
}





struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView()
    }
}
