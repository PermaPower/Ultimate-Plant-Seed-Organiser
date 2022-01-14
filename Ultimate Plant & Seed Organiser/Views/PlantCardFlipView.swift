//
//  PlantCardFlipView.swift
//  Ultimate Plant & Seed Organiser
//
//  Created by David Power on 5/1/2022.
//

import SwiftUI

struct PlantCardFlipView : View {
    
    @State var showBack = false

    var body : some View {
        
        let front = CardTagFront()
        let back = CardTagBack()
   
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
