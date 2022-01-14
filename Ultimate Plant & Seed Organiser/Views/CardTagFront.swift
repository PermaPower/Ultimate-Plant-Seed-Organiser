//
//  CardTag.swift
//  Ultimate Plant & Seed Organiser
//
//  Created by David Power on 8/1/2022.
//
// https://ericasadun.com/2020/06/25/coloring-svg-assets-in-swiftui/
// Make sure SVG is scaled to 100 before saving
// https://yqnn.github.io/svg-path-editor/
// https://quassum.github.io/SVG-to-SwiftUI/

import SwiftUI

struct CardTagFront: View {
    
    let gradient1: Gradient = Gradient(colors: [ Color(hex: 0xA08700),  .white, .white, Color(hex: 0xA08700) ])
    let gradient2: Gradient = Gradient(colors: [ .white, Color(hex: 0xA08700 , opacity: 0.8), Color(hex: 0xA08700) , .white ])
    let gradient3: Gradient = Gradient(colors: [ .white,   Color(hex: 0xA08700) ])
    
    @State var textLableTitle = "yPos"
    @State var textLableSubTitle = "Front"
    
    @State private var scrollViewContentOffset = CGFloat(0)
    
    @StateObject var scrollTrackYPos = ScrollTrack()
    
    var body: some View {
        
        TrackableScrollView(.vertical, showIndicators: false, contentOffset: $scrollViewContentOffset) {
            
            ScrollView(){
                
                Group{
                    VStack(spacing: 0){
                        
                        // Top
                        TagTopShape()
                            .fill(Color.green)
                            .frame(width: nil, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        
                        // Middle
                        Rectangle()
                            .fill(Color.green)
                            .frame(width: nil, height: 500, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        
                        // Bottom
                        ZStack {
                            
                            // Bottom Shape
                            TagBottomShape()
                                .fill(Color.green)
                                .frame(width: nil, height: 500, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            
                            Text("Content offset: \(Int(scrollViewContentOffset))")
                                .font(.title)
                                .foregroundColor(Color.white)
                                .font(.custom("Georgia",  size: 40, relativeTo: .headline))
                                .padding(.bottom, 380)
                            
                            
                            Text(textLableSubTitle)
                                .foregroundColor(Color.white)
                                .font(.custom("Georgia",  size: 20, relativeTo: .headline)).italic()
                                .padding(.bottom, 300)
                            
                            // Label
                            Group() {
                                
                                // Centre line
                                Rectangle()
                                    .fill(
                                        LinearGradient(gradient: Gradient(colors: [Color.tagColor, .black]), startPoint: .top, endPoint: .bottom)
                                    )
                                    .opacity(0.8)
                                    .frame(width: 1, height: 400, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                
                                // Left line
                                Rectangle()
                                    .fill(AngularGradient(gradient: gradient1,center: .center, startAngle: .degrees(0), endAngle: .degrees(440)))
                                    .frame(width: nil, height: 500, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .padding(.leading, -120)
                                
                                
                                // Right Line
                                Rectangle()
                                    .fill(AngularGradient(gradient: gradient2,center: .center, startAngle: .degrees(0), endAngle: .degrees(460)))
                                    .frame(width: nil, height: 500, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .padding(.trailing, -120)
                                
                                
                            }
                            .compositingGroup()
                            .mask(
                                TagLabelShape()
                                    .clipped()
                                
                            )
                            .blendMode(.softLight)
                            .padding(.leading, 20)
                            .padding(.trailing,20)
                            
                            Group() {
                                ZStack {
                                    Circle()
                                        .fill(Color.red)
                                        .frame(width: 80, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    
                                    RecycleShape()
                                        .fill(Color.white)
                                        .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                }
                            }
                            .opacity(0.7)
                            .padding(.bottom, 140)
                            
                        }
                        
                    }
                    
                }
                
            }
            .shadow(color: Color.primary.opacity(0.2), radius: 5, x: 10, y: 0)
            .navigationTitle("Plant Tag Details")
            //  .background(Color.gray.edgesIgnoringSafeArea(.all))
            
        }
        
    }
    
}

struct CardTag_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            CardTagFront()
        }
    }
}
