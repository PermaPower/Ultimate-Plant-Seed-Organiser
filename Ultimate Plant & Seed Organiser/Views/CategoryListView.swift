//
//  ContentView.swift
//  Ultimate Plant & Seed Organiser
//
//  Created by David Power on 5/1/2022.
//

import SwiftUI

struct CategoryListView: View {
    
    @StateObject var vm = CoreDataRelationshipViewModel()
        
    @State var isAddPresented = false
    @State var isSearchPresented = false
    
    var body: some View {
        NavigationView{
            
            List {
                ForEach(vm.categoryList, id: \.id) { cat in
                    NavigationLink {
                        PlantListView()
                    } label: {
                        Text(cat.name ?? "")
                    }
                }
                .onDelete(perform: { indexSet in
                    indexSet.forEach { index in
                        let c = vm.categoryList[index]
                        vm.deleteCategory(category: c)
                        vm.getCategories()
                    }
                })
               
            }
            .navigationTitle("Category")
            
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    
                    Button("Add") {
                        self.isAddPresented = true
                    }
                    .sheet(isPresented: $isAddPresented,
                           onDismiss: {
                        self.isAddPresented = false
                        vm.getCategories()
                    }) {
                        AddCategoryView()
                    }
                    
                    Button("Search") {
                        self.isSearchPresented = true
                    }
                    .sheet(isPresented: $isSearchPresented,
                           onDismiss: {
                        self.isSearchPresented = false
                        vm.getCategories()
                    }) {
                        SearchCategoryView()
                    }
                    
                    EditButton()
                }
            }
        }
    }
    
   
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
                
        CategoryListView()
    }
}
