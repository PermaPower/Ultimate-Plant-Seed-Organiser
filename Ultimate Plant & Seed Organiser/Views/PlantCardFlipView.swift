//
//  PlantCardFlipView.swift
//  Ultimate Plant & Seed Organiser
//
//  Created by David Power on 5/1/2022.
//

import SwiftUI

struct PlantCardFlipView : View {
    
    @State var showBack = false
    
    let sample1 = "If you know you have an unpleasant nature and dislike people, this is no obstacle to work."
    let sample2 = "One thing is for sure – a sheep is not a creature of the air."
    
    var body : some View {
        
      //  let front = CardFace(text: sample1, background: Color.yellow)
      //  let back = CardFace(text: sample2, background: Color.green)
        
        let front = CardTag()
        let back = CardTag()
   
        VStack() {
            Spacer()
            FlipView(front: front, back: back, showBack: $showBack)
            Spacer()
        }
        
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button(action: { self.showBack = false }) { Text("Front")}.disabled(showBack == false)
                Spacer()
                Button(action: {
                    withAnimation(Animation.linear(duration: 0.4)) {
                        self.showBack.toggle()
                    }
                }) { Text("Toggle")}
                Spacer()
                Button(action: { self.showBack = true }) { Text("Back")}.disabled(showBack == true)
            }
            
        }
        .navigationTitle("Plant Card View")
    }
    
}

struct PlantCardFlipView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            PlantCardFlipView()
        }
    }
}
