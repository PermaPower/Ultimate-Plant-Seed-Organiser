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
        request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        
        do {
            categoryList = try manager.context.fetch(request)
        }  catch let error {
            print("Error fetching Core Data. \(error.localizedDescription)")
        }
        
    }
    
    func addCategory(categoryName: String) {
        
        let newCategory = CategoryEntity(context: manager.context)
        newCategory.id = UUID()
        newCategory.name = categoryName
        
        save()
                
    }
    
    func deleteCategory(category: CategoryEntity) {
        
        manager.context.delete(category)
        
        save()
    }
    
    func save() {
                
        // Merge duplicates first in CoreData
        self.manager.context.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        
        manager.save()
    
    }
    
}
