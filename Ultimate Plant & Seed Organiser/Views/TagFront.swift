//
//  TagBackgroundShape.swift
//  Ultimate Plant & Seed Organiser
//
//  Created by David Power on 15/1/2022.
//

import SwiftUI

struct TagFront: View {
    
//    @State private var scrollViewContentOffset = CGFloat(0)
//
//    @Binding var contentOffset: CGFloat
//
    @State var textLableSubTitle = "Front"
    
//    @StateObject var frontTagValue = FrontTagPos()
//
//    var getPos = PlantCardFlipView()
//
    var body: some View {
        
        let gradient1: Gradient = Gradient(colors: [ Color(hex: 0xA08700),  .white, .white, Color(hex: 0xA08700) ])
        let gradient2: Gradient = Gradient(colors: [ .white, Color(hex: 0xA08700 , opacity: 0.8), Color(hex: 0xA08700) , .white ])
                    
            
//
//        GeometryReader { outsideProxy in
//
//
//            ScrollViewReader { scrollView in
//
                
//                ScrollView(showsIndicators: false){
                    
                 
                   
                        
                    
//                    GeometryReader { insideProxy in
//
//                        Color.clear
//                            .preference(key: ScrollOffsetPreferenceKey.self, value: [self.calculateContentOffset(fromOutsideProxy: outsideProxy, insideProxy: insideProxy)])
//                    }
                    
                    Group{
                        VStack(spacing: 0){
                            
                            
                            
                            // Top
                            TagTopShape()
                                .fill(Color.green)
                                .frame(width: nil, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            
                            
                            // Middle
                            Rectangle()
                                .fill(Color.green)
                                .frame(width: nil, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            
                            // Bottom
                            ZStack {
                                
                                // Bottom Shape
                                TagBottomShape()
                                    .fill(Color.green)
                                    .frame(width: nil, height: 500, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                
//                                Text("Offset: \(String(format: "%.2f", contentOffset))")
//                                    .font(.title)
//                                    .foregroundColor(Color.white)
//                                    .font(.custom("Georgia",  size: 40, relativeTo: .headline))
//                                    .padding(.bottom, 380)
//
                                
                                Text("Front View")
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
                   
                    
//                }
               
                
                .shadow(color: Color.primary.opacity(0.2), radius: 5, x: 10, y: 0)
                .navigationTitle("Plant Tag Details")
                //  .background(Color.gray.edgesIgnoringSafeArea(.all))
//                .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
//                    self.contentOffset = value[0]
//                }
//                .environmentObject(frontTagValue)
            
                           
                
            }
           
            
        
//        }
        
        
        
//    }
    
//    private func calculateContentOffset(fromOutsideProxy outsideProxy: GeometryProxy, insideProxy: GeometryProxy) -> CGFloat {
//
//        return outsideProxy.frame(in: .global).minY - insideProxy.frame(in: .global).minY
//
//    }
}

//struct TagBackgroundShape_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView{
//            TagFront()
////            TagFront(contentOffset: .constant(0), textLableSubTitle: "")
////                .environmentObject(FrontTagPos())
//        }
//    }
//}

