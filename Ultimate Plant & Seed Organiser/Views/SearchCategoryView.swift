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
                HStack{
                    TextField("Search Name", text: $sText)
                        .textFieldStyle(.roundedBorder)
                        .padding(.leading)
                        .onAppear(perform: {sText = ""})
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("\(Image(systemName: "magnifyingglass"))")
                            .padding(.trailing)
                    }}
            }
            .navigationTitle("Search Category")
            
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    
                    Button(action: {
                        sText = ""
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("\(Image(systemName: "text.badge.minus"))")
                    }
                }
            }
        }
    }
}


struct SearchCategoryView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        SearchCategoryView(sText: .constant("Search Key World"))
    }
}
