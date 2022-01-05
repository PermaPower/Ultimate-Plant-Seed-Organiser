//
//  ContentView.swift
//  Ultimate Plant & Seed Organiser
//
//  Created by David Power on 5/1/2022.
//

import SwiftUI

struct CategoryListView: View {
    
    let testcategoryList = ["Category A","Category B"]
    
    @State var isAddPresented = false
    
    var body: some View {
        NavigationView{
            
            List {
                ForEach(testcategoryList, id: \.self) { cat in
                    NavigationLink {
                        PlantListView()
                    } label: {
                        Text(cat)
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
        //  testcategoryList.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
            CategoryListView()
    }
}
