//
//  PlantListView.swift
//  Ultimate Plant & Seed Organiser
//
//  Created by David Power on 5/1/2022.
//

import SwiftUI

struct PlantListView: View {
    
    let testcategoryList = ["Plant A","Plant B"]
    
    @State var isAddPresented = false
    
    var body: some View {
        
        List {
            ForEach(testcategoryList, id: \.self) { cat in
                NavigationLink {
                    PlantCardFlipView()
                } label: {
                    Text(cat)
                }
            }
            .onDelete(perform: delete)
        }
        .navigationTitle("Plants")
        
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                
                Button("Add") {
                    self.isAddPresented = true
                }
                .sheet(isPresented: $isAddPresented,
                       onDismiss: { self.isAddPresented = false }) {
                    AddPlantView()
                }
                
                Button("Search") {
                    self.isAddPresented = true
                }
                .sheet(isPresented: $isAddPresented,
                       onDismiss: { self.isAddPresented = false }) {
                    SearchPlantView()
                }
                
                EditButton()
            }
        }
    }
    
    func delete(at offsets: IndexSet) {
      //  testcategoryList.remove(atOffsets: offsets)
        }
}

struct PlantListView_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView{
            PlantListView()
        }
    }
}
