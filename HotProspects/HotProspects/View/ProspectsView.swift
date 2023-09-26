//
//  ProspectsView.swift
//  HotProspects
//
//  Created by Jumoke Bolanle on 9/26/23.
//

import SwiftUI


struct ProspectsView: View {
    @EnvironmentObject var prospects: Prospects

    enum FilterType {
        case none, contacted, notcontacted
    }

    let filter: FilterType

    var body: some View {

        NavigationView {
            Text("People: \(prospects.people.count)")
                .navigationTitle(title)
                .toolbar {
                    Button {
                        let prospect = Prospect()
                        prospect.name = "T-Pain"
                        prospect.emailAddress = "t-pain@t-pain.com"
                        prospects.people.append(prospect)
                    } label: {
                        Label("Scan", systemImage: "qrcode.viewfinder")
                    }
                }
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
            .environmentObject(Prospects())
    }
}
