//
//  A.swift
//  Ultimate Plant & Seed Organiser
//
//  Created by David Power on 16/1/2022.
//

import SwiftUI

struct A: View {
    
    @State var textLableTitle = "A"
    @State var textLableSubTitle = "Sunny"
    
    // set tag height here
    private let tagheight:CGFloat = 850
    
    var body: some View {
        
        VStack {
            ZStack{
                
                TagBackground()
                    .frame(width: .infinity, height: tagheight, alignment: .center)
                
                // Configure view
                Group {
                    Text(textLableTitle)
                        .foregroundColor(Color.white)
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

struct A_Previews: PreviewProvider {
    static var previews: some View {
        A()
    }
}

