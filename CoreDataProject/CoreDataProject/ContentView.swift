//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Jumoke Bolanle on 6/20/23.
//

import CoreData
import SwiftUI

//MARK: CUSTOM STRUCTS


struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @State private var lastNameFilter = "A"
    
    
    //MARK: CONTENTVIEW
    var body: some View {
        VStack {
            FilteredList(filterKey: "lastName", filterValue: lastNameFilter) { (singer: Singer) in
                Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
            }
            
            Button("Add Examples") {
                let taylor = Singer(context: moc)
                taylor.firstName = "Taylor"
                taylor.lastName = "Swift"
                
                let ed = Singer(context: moc)
                ed.firstName = "Ed"
                ed.lastName = "Sheeran"
                
                let adele = Singer(context: moc)
                adele.firstName = "Adele"
                adele.lastName = "Adkins"
                
                try? moc.save()
            }
            
            Button("Show A") {
                lastNameFilter = "A"
            }
            Button("Show S") {
                lastNameFilter = "S"
            }
        }
    }
}

//MARK: PREVIEWS
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
