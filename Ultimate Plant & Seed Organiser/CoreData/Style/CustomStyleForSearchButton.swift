//
//  CustomStyleForSearchButton.swift
//  Ultimate Plant & Seed Organiser
//
//  Created by David Power on 6/1/2022.
//

import SwiftUI

struct CustomStyleForSearchButton: ButtonStyle {
    
    var status = false
    var editStatus = false
    
    private var activeColor: Color {
        if editStatus {
            return .gray
        } else {
            return .blue
        }
    }
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(status ? activeColor : .red)
    }
}
