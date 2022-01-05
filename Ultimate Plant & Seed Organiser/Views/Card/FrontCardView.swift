//
//  FrontCard.swift
//  Ultimate Plant & Seed Organiser
//
//  Created by David Power on 5/1/2022.
//

import SwiftUI

struct FrontCardView : View {
    var body: some View {
        Text("One thing is for sure – a sheep is not a creature of the air.").padding(5).frame(width: 250, height: 150, alignment: .center).background(Color.yellow)
    }
}

struct FrontCard_Previews: PreviewProvider {
    static var previews: some View {
        FrontCardView()
    }
}
