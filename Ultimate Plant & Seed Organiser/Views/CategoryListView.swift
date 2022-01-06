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
    
    @State var configuration: Bool
    
    @State var sText: String
    
    var body: some View {
        
        NavigationView{
            
            if vm.categoryList.count == 0 {
                Text("Add your first category")
                    .navigationTitle("Category")
                    .toolbar {
                        ToolbarItemGroup(placement: .navigationBarTrailing) {
                            
                            Button("\(Image(systemName: "plus"))") {
                                self.isAddPresented = true
                            }
                            .sheet(isPresented: $isAddPresented,
                                   onDismiss: {
                                self.isAddPresented = false
                                vm.getCategories()
                            }) {
                                AddCategoryView()
                            }
                        }}
            } else {
                
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
                        
                        Button("\(Image(systemName: "plus"))") {
                            self.isAddPresented = true
                        }
                        .sheet(isPresented: $isAddPresented,
                               onDismiss: {
                            self.isAddPresented = false
                            vm.getCategories()
                        }) {
                            AddCategoryView()
                        }
                        
                        
                        Button("\(Image(systemName: "magnifyingglass"))") {
                            self.isSearchPresented = true
                        }
                        
                        .sheet(isPresented: $isSearchPresented,
                               onDismiss: {
                            self.isSearchPresented = false
                            if sText != "" {
                                vm.searchCategories(nameString: sText)
                            }
                            else
                            {
                                vm.getCategories()
                            }
                            
                        }) {
                            SearchCategoryView(sText: $sText)
                        }
                        
                        EditButton()
                        
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        CategoryListView(configuration: true, sText: "")
    }
}
