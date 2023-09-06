//
//  EditView-ViewModel.swift
//  BucketList
//
//  Created by Jumoke Bolanle on 9/4/23.
//

import Foundation

extension EditView {
    @MainActor class ViewModel: ObservableObject {
        @Published var name: String
        @Published var description: String

        @Published var loadingState = LoadingState.loading
        @Published var pages = [Page]()

        var location: Location

        var onSave: (Location) -> Void

        init(location: Location, onSave: @escaping (Location) -> Void) {
            self.location = location
            self.onSave = onSave

            _name = Published(initialValue: location.name)
            _description = Published(initialValue: location.description)
        }

        enum LoadingState {
            case loading, loaded, failed
        }

        func fetchNearbyPlaces() async {

            let urlString = "https://en.wikipedia.org/w/api.php?ggscoord=\(location.latitude)%7C\(location.longitude)&action=query&prop=coordinates%7Cpageimages%7Cpageterms&colimit=50&piprop=thumbnail&pithumbsize=500&pilimit=50&wbptterms=description&generator=geosearch&ggsradius=10000&ggslimit=50&format=json"

            guard let url = URL(string: urlString) else {
                print("Bad URL: \(urlString)")
                return
            }

            do {
                let (data, _) = try await URLSession.shared.data(from: url)

                // got some data back
                let items = try JSONDecoder().decode(Result.self, from: data)

                //success - convert the array values to our pages array
                pages = items.query.pages.values.sorted() { $0.title < $1.title }
                loadingState = .loaded
            } catch {
                //if we're still here, means the request failed somehow
                loadingState = .failed
            }

        }
    }
}
