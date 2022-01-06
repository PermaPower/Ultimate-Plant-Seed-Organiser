//
//  SearchCategoryView.swift
//  Ultimate Plant & Seed Organiser
//
//  Created by David Power on 6/1/2022.
//

import SwiftUI

struct SearchCategoryView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var vm = CoreDataRelationshipViewModel()
    
    @Binding var sText: String
    
    var body: some View {
        NavigationView {
            VStack{
                TextField("Search Name", text: $sText)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                    .onAppear(perform: {sText = ""})
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Search")
                }
                
                Button {
                    sText = ""
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Reset")
                }
                
                Button {
                    sText = ""
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Cancel")
                }
                
            }
        }
        .navigationTitle("Search Category")
    }
}

struct SearchCategoryView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        NavigationView{
            SearchCategoryView(sText: .constant("C"))
        }
    }
}
