//
//  CoreDataRelationshipViewModel.swift
//  Ultimate Plant & Seed Organiser
//
//  Created by David Power on 5/1/2022.
//

import SwiftUI
import CoreData

class CoreDataRelationshipViewModel: ObservableObject {
    
    let manager = CoreDataManager.instance
    @Published var categoryList: [CategoryEntity] = []
    
    init() {
        getCategories()
    }
    
    func getCategories() {
        
        let request = NSFetchRequest<CategoryEntity>(entityName: "CategoryEntity")
        
        do {
            categoryList = try manager.context.fetch(request)
        }  catch let error {
            print("Error fetching Core Data. \(error.localizedDescription)")
        }
        
    }
    
    func addCategory() {
        
        let newCategory = CategoryEntity(context: manager.context)
        newCategory.name = "Category A"
        
        save()
        getCategories()
    }
    
    func save() {
                
        // Merge duplicates first in CoreData
        self.manager.context.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        
        manager.save()
    }
    
}
