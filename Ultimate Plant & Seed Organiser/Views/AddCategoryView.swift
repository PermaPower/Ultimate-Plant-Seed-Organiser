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
            VStack{
                TextField("Enter Category Name", text: $categoryName)
                    .textFieldStyle(.roundedBorder)
                    .padding()
            Button {
                vm.addCategory(categoryName: categoryName)
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Add Category")
            }
            
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Cancel")
            }
            }
        }
        .navigationTitle("Add Category")
    }
}

struct AddCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
        AddCategoryView()
        }
    }
}
