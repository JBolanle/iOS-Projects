//
//  DataController.swift
//  CoreDataProject
//
//  Created by Jumoke Bolanle on 6/21/23.
//

import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "CoreDataProject")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to laod: \(error.localizedDescription)")
            }
        }
    }
}
