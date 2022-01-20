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
        
        let front = A(showBack: $showBack)
        let back = B(showBack: $showBack)
    
        ScrollView (showsIndicators: false){
           
            FlipView(front: front, back: back, updateTagView: true, showBack: $showBack)
        }
    
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                
                Spacer()
                Button(action: {
                    
                    withAnimation(Animation.linear(duration: 0.35)) {
                        self.showBack.toggle()
    
                        
                    }
                }) { showBack == true ? Text("\(Image(systemName: "info.circle"))") : Text("\(Image(systemName: "camera.circle"))")}
                Spacer()
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
