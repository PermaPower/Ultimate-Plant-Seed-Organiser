//
//  CoreDataManager.swift
//  Ultimate Plant & Seed Organiser
//
//  Created by David Power on 5/1/2022.
//

import SwiftUI
import CoreData

class CoreDataManager {
    
    static let instance = CoreDataManager()
    let container: NSPersistentContainer
    let context: NSManagedObjectContext
    
    init() {
        container = NSPersistentContainer(name: "CoreDataContainer")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("Error loading Core Data. \(error)")
            }
        }
        context = container.viewContext
    }
    
    func save() {
        do {
            try context.save()
            print("Saved Core Data Successfully")
        } catch let error {
            print("Error saving Core Data. \(error.localizedDescription)")
        }
    }
}
