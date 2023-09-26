//
//  ProspectsView.swift
//  HotProspects
//
//  Created by Jumoke Bolanle on 9/26/23.
//

import SwiftUI


struct ProspectsView: View {
    enum FilterType {
        case none, contacted, notcontacted
    }

    let filter: FilterType

    var body: some View {
        NavigationView {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .navigationTitle(title)
        }
    }

    var title: String {
        switch filter {
        case .none:
            return "Everyone"
        case .contacted:
            return "Contacted"
        case .notcontacted:
            return "Not Contacted"
        }
    }
}

struct ProspectsView_Previews: PreviewProvider {
    static var previews: some View {
        ProspectsView(filter: .none)
    }
}
