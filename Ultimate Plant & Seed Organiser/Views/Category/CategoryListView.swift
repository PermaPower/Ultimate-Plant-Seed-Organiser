//
//  ContentView.swift
//  Ultimate Plant & Seed Organiser
//
//  Created by David Power on 5/1/2022.
//

import SwiftUI

struct CategoryListView: View {
    
    @Environment(\.editMode) private var editMode
    
    @StateObject var vm = CoreDataRelationshipViewModel()
    
    @State private var isAddPresented = false
    @State private var isSearchPresented = false
    
    @State private var isSubtitleVisible: Bool = false
    
    @State var editModeStatus: EditMode = .inactive

    @State var searchNameText: String
    
    // Compute if Categories Exist yet or not to show different view
    private var showCustomViewWhenListBlank: Bool {
        vm.categoryList.count == 0 ? true : false
    }
    
    var body: some View {
        
        let navigationBarTitle: String = "Plant Category"
        
        NavigationView {
            
            List {
                
                ForEach(vm.categoryList, id: \.id) { cat in
                    
                    NavigationLink {
                        //   PlantListView(sText: "")
                    } label: {
                        Text(cat.name ?? "")
                        
                    }
                }
                            
                
                .onDelete(perform: { indexSet in
                    
                    indexSet.forEach { index in
                        let c = vm.categoryList[index]
                        vm.deleteCategory(category: c)
                        vm.refreshCategoryList(nameFilterString: "", entity: "CategoryEntity")
                        
                    }
                })
          //      .deleteDisabled(searchNameText != "")
            //    .deleteDisabled( editModeStatus == .active ? false : true)

                
            }
            
            
            .navigationTitle("\(navigationBarTitle)")
            
           
            
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    
                    Button("\(Image(systemName: "plus"))") {
                        self.isAddPresented = true
                        
                    }
                    .sheet(isPresented: $isAddPresented,
                           onDismiss: {
                        self.isAddPresented = false
                        vm.refreshCategoryList(nameFilterString: "", entity: "CategoryEntity")
                    }) {
                        AddCategoryView()
                    }
                //    .disabled(editModeStatus == .active ? true : false)
                 //   .disabled(searchNameText != "")
                    
                    
                    
                    Button("\(Image(systemName: "magnifyingglass"))") {
                        self.isSearchPresented = true
                    }
                    
                    .sheet(isPresented: $isSearchPresented,
                           onDismiss: {
                                                
                       
                        vm.refreshCategoryList(nameFilterString: searchNameText, entity: "CategoryEntity")
                        
                        self.isSearchPresented = false
                        
                    }) {
                        SearchCategoryView(sText: $searchNameText)
                    }
                    
                //    .disabled(editModeStatus == .active ? true : false)
                 //   .disabled(vm.categoryList.count < 2)
                    
//                    .buttonStyle( CustomStyleForSearchButton(status: searchNameText == "", editStatus: editModeStatus == .active))
//
                   
                    
                    
                    
                    
                    EditButton()
                   //     .disabled(searchNameText != "")
                     //   .disabled(vm.categoryList.count == 0)
                    
                }
            }
            // track edit mode status
            .environment(\.editMode, $editModeStatus)
            
            .if(showCustomViewWhenListBlank) { view in

                Text("No Plant Categories Yet")
                    .toolbar {
                        ToolbarItemGroup(placement: .navigationBarTrailing) {

                            Button("\(Image(systemName: "plus"))") {
                                self.isAddPresented = true

                            }
                            .sheet(isPresented: $isAddPresented,
                                   onDismiss: {
                                self.isAddPresented = false
                                vm.refreshCategoryList(nameFilterString: "", entity: "CategoryEntity")
                            }) {
                                AddCategoryView()
                            }
                        }
                    }
            }
            
            
            
        }
    }
}

extension View {
    /// Applies the given transform if the given condition evaluates to `true`.
    /// - Parameters:
    ///   - condition: The condition to evaluate.
    ///   - transform: The transform to apply to the source `View`.
    /// - Returns: Either the original `View` or the modified `View` if the condition is `true`.
    /// https://www.avanderlee.com/swiftui/conditional-view-modifier/
    
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        CategoryListView(searchNameText: "")
    }
}
