//
//  CustomStyleForSearchButton.swift
//  Ultimate Plant & Seed Organiser
//
//  Created by David Power on 6/1/2022.
//

import SwiftUI

struct CustomStyleForSearchButton: ButtonStyle {
    var disabled = false
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
        .foregroundColor(disabled ? .blue : .red)
        
    }
}
