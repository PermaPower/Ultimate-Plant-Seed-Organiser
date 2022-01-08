//
//  AddCategoryView.swift
//  Ultimate Plant & Seed Organiser
//
//  Created by David Power on 5/1/2022.
//

import SwiftUI

struct AddCategoryView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var vm = CoreDataRelationshipViewModel()
    
    @State var categoryName: String = ""
    
    var body: some View {
        NavigationView {
            
            HStack{
                TextField("Enter Category Name", text: $categoryName)
                    .textFieldStyle(.roundedBorder)
                    .padding(.leading)
                    .onAppear(perform: {categoryName = ""})
                Button {
                    vm.addCategory(categoryName: categoryName)
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("\(Image(systemName: "plus"))")
                        .padding(.trailing)
                }
            
            .navigationTitle("Add Category")
                
                
                
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("\(Image(systemName: "xmark"))")
                        
                    }
                }
            }
            }
        }
        
    }
}




struct AddCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        AddCategoryView()
    }
}
