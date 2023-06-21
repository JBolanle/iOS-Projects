//
//  CoreDataProjectApp.swift
//  CoreDataProject
//
//  Created by Jumoke Bolanle on 6/20/23.
//

import SwiftUI

@main
struct CoreDataProjectApp: App {
    @State private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
