//
//  Prospect.swift
//  HotProspects
//
//  Created by Jumoke Bolanle on 9/26/23.
//

import SwiftUI

class Prospect: Identifiable, Codable {
    var id = UUID()
    var name = "Anonymous"
    var emailAddress = ""
    var isContacted = false
}

@MainActor
class Prospects: ObservableObject {
    @EnvironmentObject var prospects: Prospects
    @Published var people: [Prospect]


    init() {
        self.people = []
    }
}


