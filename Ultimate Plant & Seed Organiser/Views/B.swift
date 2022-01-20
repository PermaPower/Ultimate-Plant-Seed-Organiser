//
//  B.swift
//  Ultimate Plant & Seed Organiser
//
//  Created by David Power on 16/1/2022.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

struct B: View {
    
    @State var textLableTitle = "B"
    @State var textLableSubTitle = "Sunny"
    
    @Binding var showBack : Bool
    
    @StateObject var progress = TagAnimationProgressAngle()
    
    @State private var image: Image?
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    
    // set tag height here
    private let tagheight:CGFloat = 850
    
    var body: some View {
        
        VStack {
            ZStack{
                
                TagBackground(showBack: $showBack)
                    .frame(width: nil, height: tagheight, alignment: .center)
                
                // Configure view
                Group {
                    
                    VStack {
                        image?
                            .resizable()
                            .scaledToFill()
                            .frame(minWidth: 200, idealWidth: .infinity, maxWidth: .infinity, minHeight: 200, idealHeight: 240, maxHeight: 240, alignment: .center)
                            .border(Color.pink)
                            .clipped()
                            .cornerRadius(10)
                            .overlay(RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.white, lineWidth: 2))
                        
                        if image == nil {
                            Button {
                                showingImagePicker = true
                            } label: {
                                Image("plant_Example_Image")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(minWidth: 200, idealWidth: .infinity, maxWidth: .infinity, minHeight: 200, idealHeight: 240, maxHeight: 240, alignment: .center)
                                    .border(Color.pink)
                                    .clipped()
                                    .cornerRadius(10)
                                    .overlay(RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color.white, lineWidth: 2))
                            }
                        }
                        
                        
                    }
                    .onAppear(perform: loadImage)
                    .padding(.bottom, 440)
                    .padding(.leading, 22)
                    .padding(.trailing, 22)
                    .sheet(isPresented: $showingImagePicker) {
                        ImagePicker(image: $inputImage)
                    }
                    .onChange(of: inputImage) { _ in loadImage() }
                    
                    
                    
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
        .toolbar {
            if showBack == true {
                Button {
                    showingImagePicker = true
                } label: {
                    Text("\(Image(systemName: "photo.circle"))")
                }
            }
        }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
    
}

struct B_Previews: PreviewProvider {
    static var previews: some View {
        B(showBack: .constant(true))
    }
}
