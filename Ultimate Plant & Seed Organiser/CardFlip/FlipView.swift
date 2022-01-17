//
//  FlipView.swift
//  Ultimate Plant & Seed Organiser
//
//  Created by David Power on 5/1/2022.
//

import SwiftUI

struct FlipView<SomeTypeOfViewA : View, SomeTypeOfViewB : View> : View {
    
    var front : SomeTypeOfViewA
    var back : SomeTypeOfViewB
    
    @State private var flipped = false
    
    @StateObject var progress = TagAnimationProgressAngle()
    
    @State var updateTagView : Bool
    
    @Binding var showBack : Bool
    
    var body: some View {
    
        return VStack {
            Spacer()
                        
            ZStack() {
                
                front.opacity(flipped ? 0.0 : 1.0)
                back.opacity(flipped ? 1.0 : 0.0)
                
            }
            .modifier(FlipEffect(progress: progress, flipped: $flipped, angle: showBack ? 180 : 0, axis: (x: 0, y: 1)))
//            .onTapGesture {
//                withAnimation(Animation.linear(duration: 0.1)) {
//                    self.showBack.toggle()
//                }
//            }
            Spacer()
        }
    }
}
