//
//  AddCategoryView.swift
//  Ultimate Plant & Seed Organiser
//
//  Created by David Power on 5/1/2022.
//

import SwiftUI

struct AddCategoryView: View {
    
    @StateObject var vm = CoreDataRelationshipViewModel()
  
    var body: some View {
        NavigationView {
            Button {
                vm.addCategory()
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
