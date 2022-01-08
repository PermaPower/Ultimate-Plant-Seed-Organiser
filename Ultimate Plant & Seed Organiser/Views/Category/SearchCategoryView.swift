//
//  SearchCategoryView.swift
//  Ultimate Plant & Seed Organiser
//
//  Created by David Power on 6/1/2022.
//

import SwiftUI

struct SearchCategoryView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var vm = CoreDataRelationshipViewModel()
    
    @State private var showAlertIcon =  true
    
    @Binding var sText: String
    
    
    var body: some View {
        
        NavigationView {
            
            VStack{
                
                Text("Categories found: \(vm.categoryList.count)")
                
                HStack{
                    
                    HStack {
                        
                        Group() {
                            
                            if sText.count != 0 {
                                
                                if showAlertIcon {
                                    
                                    EmptyView()
                                        .modifier(EmptyModifier(isEmpty: vm.categoryList.count == 0))
                                    
                                }
                                
                            }
                            TextField("Search Name", text: $sText)
                            
                                .textFieldStyle(.roundedBorder)
                                .onAppear(perform: {sText = ""})
                                .onChange(of: sText) { newValue in
                                    vm.refreshCategoryList(nameFilterString: sText, entity: "CategoryEntity")
                                }
                            
                            
                            
                        }
                        
                        Button {
                            vm.refreshCategoryList(nameFilterString: sText, entity: "CategoryEntity")
                            
                            if vm.categoryList.count != 0  {                 presentationMode.wrappedValue.dismiss()
                            }
                            
                        } label: {
                            Text("\(Image(systemName: "magnifyingglass"))")
                            
                            
                        }
                        .disabled(vm.categoryList.count == 0)
                        
                    }
                }.padding()
            }
            .navigationTitle("Search Category")
            
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    
                    Button(action: {
                        sText = ""
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("\(Image(systemName: "xmark"))")
                    }
                }
            }
        }
    }
}

struct EmptyModifier: ViewModifier {
    
    let isEmpty: Bool
    
    func body(content: Content) -> some View {
        Group {
            if isEmpty {
                Text("\(Image(systemName: "exclamationmark.circle"))")
            } else {
                
            }
        }
    }
}
struct SearchCategoryView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        SearchCategoryView(sText: .constant(""))
    }
}
