//
//  B.swift
//  Ultimate Plant & Seed Organiser
//
//  Created by David Power on 16/1/2022.
//

import SwiftUI

struct B: View {
    
    @State var textLableTitle = "B"
    @State var textLableSubTitle = "Sunny"
        
    @Binding var showBack : Bool
    
    @StateObject var progress = TagAnimationProgressAngle()

    
    // set tag height here
    private let tagheight:CGFloat = 850
    
    var body: some View {
        
        VStack {
            ZStack{
                
                TagBackground(showBack: $showBack)
                    .frame(width: nil, height: tagheight, alignment: .center)
                
                // Configure view
                Group {
                    Text(textLableTitle)
                        .foregroundColor(progress.angle != 90  ? Color.blue : Color.red)
                        .font(.custom("Georgia",  size: 40, relativeTo: .headline))
                        .padding(.bottom, 80)
                    
                    
                    Text(textLableSubTitle)
                        .foregroundColor(Color.white)
                        .font(.custom("Georgia",  size: 20, relativeTo: .headline)).italic()
                }
                
            }
        }
    }
    
  
}

struct B_Previews: PreviewProvider {
    static var previews: some View {
        B(showBack: .constant(true))
    }
}
