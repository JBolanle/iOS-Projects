//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Jumoke Bolanle on 6/23/23.
//

import SwiftUI

struct FilteredList: View {
    @FetchRequest var fetchRequest: FetchedResults<Singer>
    
    init(filter: String) {
        _fetchRequest = FetchRequest<Singer>(sortDescriptors: [], predicate: NSPredicate(format: "lastName BEGINSWITH %@", filter))
    }
    
    
    var body: some View {
        List(fetchRequest, id: \.self) { singer in
            Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
        }
    }
}

struct FilteredList_Previews: PreviewProvider {
    static var previews: some View {
        FilteredList(filter: "")
    }
}
