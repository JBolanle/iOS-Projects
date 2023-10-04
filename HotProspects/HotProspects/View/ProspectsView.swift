//
//  ProspectsView.swift
//  HotProspects
//
//  Created by Jumoke Bolanle on 9/26/23.
//

import SwiftUI


struct ProspectsView: View {
    @EnvironmentObject var prospects: Prospects


    var body: some View {

        NavigationView {
            List{
                ForEach(filteredProspects) { prospect in
                    VStack(alignment: .leading) {
                        Text(prospect.name)
                            .font(.headline)
                        Text(prospect.emailAddress)
                            .foregroundColor(.secondary)
                    }
                }
            }
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

    enum FilterType {
        case none, contacted, notContacted
    }

    let filter: FilterType


    var title: String {
        switch filter {
        case .none:
            return "Everyone"
        case .contacted:
            return "Contacted"
        case .notContacted:
            return "Not Contacted"
        }
    }

    var filteredProspects: [Prospect] {
        switch filter {
        case .none:
            return prospects.people
        case .contacted:
            return prospects.people.filter { $0.isContacted }
        case .notContacted:
            return prospects.people.filter { !$0.isContacted}
        }
    }
}

struct ProspectsView_Previews: PreviewProvider {
    static var previews: some View {
        ProspectsView(filter: .none)
            .environmentObject(Prospects())
    }
}
