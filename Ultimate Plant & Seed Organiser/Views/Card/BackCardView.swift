//
//  BackCard.swift
//  Ultimate Plant & Seed Organiser
//
//  Created by David Power on 5/1/2022.
//

import SwiftUI

struct BackCardView : View {
    var body: some View {
        Text("If you know you have an unpleasant nature and dislike people, this is no obstacle to work.").padding(5).frame(width: 250, height: 150).background(Color.green)
    }
}

struct BackCard_Previews: PreviewProvider {
    static var previews: some View {
        BackCardView()
    }
}
