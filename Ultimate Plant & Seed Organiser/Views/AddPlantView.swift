//
//  AddPlantView.swift
//  Ultimate Plant & Seed Organiser
//
//  Created by David Power on 5/1/2022.
//

import SwiftUI

struct AddPlantView: View {
    
    @ObservedObject var vm = CoreDataRelationshipViewModel()
    
    var body: some View {
        NavigationView {

        }
        .navigationTitle("Add Plant")
    }
}

struct AddPlantView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
        AddPlantView()
        }
    }
}
