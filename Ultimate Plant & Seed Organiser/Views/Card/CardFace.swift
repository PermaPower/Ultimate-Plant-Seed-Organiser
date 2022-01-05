//
//  CardFace.swift
//  Ultimate Plant & Seed Organiser
//
//  Created by David Power on 5/1/2022.
//

import SwiftUI

struct CardFace<SomeTypeOfView : View> : View {
    var text : String
    var background: SomeTypeOfView
    
    var body: some View {
        Text(text)
            .multilineTextAlignment(.center)
            .padding(5).frame(width: 250, height: 150).background(background)
    }
}

struct CardFace_Previews: PreviewProvider {
    static var previews: some View {
        CardFace(text: "Card Face", background: Color.yellow)
    }
}
