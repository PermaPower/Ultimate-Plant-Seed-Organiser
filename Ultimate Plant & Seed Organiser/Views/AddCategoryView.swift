//
//  AddCategoryView.swift
//  Ultimate Plant & Seed Organiser
//
//  Created by David Power on 5/1/2022.
//

import SwiftUI

//** Need to refresh category list once new one is added **//

struct AddCategoryView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var vm = CoreDataRelationshipViewModel()
  
    var body: some View {
        NavigationView {
            Button {
                vm.addCategory()
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Add Category")
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
