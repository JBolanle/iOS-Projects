//
//  DataController.swift
//  Bookworm
//
//  Created by Jumoke Bolanle on 6/12/23.
//

import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "Bookworm")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to laod: \(error.localizedDescription)")
            }
        }
    }
}
