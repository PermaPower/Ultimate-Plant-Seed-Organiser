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
    
    var body: some View {
        NavigationView{
            
            List {
                ForEach(vm.categoryList, id: \.self) { cat in
                    NavigationLink {
                        PlantListView()
                    } label: {
                        Text(cat.name ?? "")
                    }
                }
                .onDelete(perform: delete)
            }
            .navigationTitle("Category")
            
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    
                    Button("Add") {
                        self.isAddPresented = true
                    }
                    .sheet(isPresented: $isAddPresented,
                           onDismiss: { self.isAddPresented = false }) {
                        AddCategoryView()
                    }
                    EditButton()
                }
            }
        }
    }
    
    func delete(at offsets: IndexSet) {
        vm.categoryList.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
                
        CategoryListView()
    }
}
