//
//  Extensions.swift
//  Ultimate Plant & Seed Organiser
//
//  Created by David Power on 15/1/2022.
//

import SwiftUI

extension Color {
    static let labelTagColor = Color("labelTagColor")
    static let labelTagColorDark = Color("labelTagColorDark")
    static let tagColor = Color("tagColor")
    static let backgroundColor = Color ("backgroundColor")
    
    init(hex: Int, opacity: Double = 1.0) {
        let red = Double((hex & 0xff0000) >> 16) / 255.0
        let green = Double((hex & 0xff00) >> 8) / 255.0
        let blue = Double((hex & 0xff) >> 0) / 255.0
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
    }
    
}


// https://quassum.github.io/SVG-to-SwiftUI/
// Make sure shape starts top left being 0

struct TagBottomShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0, y: 0))
        path.move(to: CGPoint(x: 0.5*width, y: height))
        path.addLine(to: CGPoint(x: 0.62963*width, y: 0.89655*height))
        path.addLine(to: CGPoint(x: 0.90741*width, y: 0.2931*height))
        path.addLine(to: CGPoint(x: width, y: 0.2069*height))
        path.addLine(to: CGPoint(x: width, y: 0))
        path.addLine(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: 0, y: 0.2069*height))
        path.addLine(to: CGPoint(x: 0.09259*width, y: 0.2931*height))
        path.addLine(to: CGPoint(x: 0.37037*width, y: 0.89655*height))
        path.closeSubpath()
        return path
    }
}

struct TagLabelShape: Shape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0, y: 0.01852*height))
        path.addQuadCurve(to: CGPoint(x: 0.02*width, y: 0), control: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: 0.98*width, y: 0))
        path.addQuadCurve(to: CGPoint(x: width, y: 0.01852*height), control: CGPoint(x: width, y: 0))
        path.addLine(to: CGPoint(x: width, y: 0.14815*height))
        path.addLine(to: CGPoint(x: 0.9*width, y: 0.24074*height))
        path.addLine(to: CGPoint(x: 0.6*width, y: 0.92593*height))
        path.addLine(to: CGPoint(x: 0.5*width, y: height))
        path.addLine(to: CGPoint(x: 0.4*width, y: 0.92593*height))
        path.addLine(to: CGPoint(x: 0.1*width, y: 0.24074*height))
        path.addLine(to: CGPoint(x: 0, y: 0.14815*height))
        path.closeSubpath()
        path.closeSubpath()
        return path
    }
}

struct TagTopShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.5*width, y: 0))
        path.addCurve(to: CGPoint(x: 0, y: height), control1: CGPoint(x: 0.375*width, y: 0.5*height), control2: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: width, y: height))
        path.addCurve(to: CGPoint(x: 0.5*width, y: 0), control1: CGPoint(x: width, y: 0), control2: CGPoint(x: 0.625*width, y: 0.5*height))
        return path
    }
}

struct RecycleShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.15882*width, y: 0.7271*height))
        path.addCurve(to: CGPoint(x: 0.13967*width, y: 0.7948*height), control1: CGPoint(x: 0.14815*width, y: 0.74671*height), control2: CGPoint(x: 0.13967*width, y: 0.77621*height))
        path.addCurve(to: CGPoint(x: 0.14071*width, y: 0.81222*height), control1: CGPoint(x: 0.13967*width, y: 0.79912*height), control2: CGPoint(x: 0.13967*width, y: 0.80461*height))
        path.addLine(to: CGPoint(x: 0.00744*width, y: 0.57752*height))
        path.addCurve(to: CGPoint(x: 0, y: 0.54914*height), control1: CGPoint(x: 0.00318*width, y: 0.56991*height), control2: CGPoint(x: 0, y: 0.55898*height))
        path.addCurve(to: CGPoint(x: 0.00744*width, y: 0.51967*height), control1: CGPoint(x: 0, y: 0.53928*height), control2: CGPoint(x: 0.00318*width, y: 0.5273*height))
        path.addLine(to: CGPoint(x: 0.07142*width, y: 0.40504*height))
        path.addLine(to: CGPoint(x: 0, y: 0.36359*height))
        path.addLine(to: CGPoint(x: 0.23242*width, y: 0.35919*height))
        path.addLine(to: CGPoint(x: 0.3454*width, y: 0.56768*height))
        path.addLine(to: CGPoint(x: 0.27294*width, y: 0.52511*height))
        path.addLine(to: CGPoint(x: 0.15882*width, y: 0.7271*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.26118*width, y: 0.06557*height))
        path.addCurve(to: CGPoint(x: 0.35498*width, y: 0.00986*height), control1: CGPoint(x: 0.28142*width, y: 0.02951*height), control2: CGPoint(x: 0.3145*width, y: 0.00986*height))
        path.addCurve(to: CGPoint(x: 0.45734*width, y: 0.07314*height), control1: CGPoint(x: 0.39872*width, y: 0.00986*height), control2: CGPoint(x: 0.43284*width, y: 0.03063*height))
        path.addLine(to: CGPoint(x: 0.4936*width, y: 0.13536*height))
        path.addLine(to: CGPoint(x: 0.36777*width, y: 0.35812*height))
        path.addLine(to: CGPoint(x: 0.16417*width, y: 0.23693*height))
        path.addLine(to: CGPoint(x: 0.26118*width, y: 0.06557*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.27607*width, y: 0.91594*height))
        path.addCurve(to: CGPoint(x: 0.16521*width, y: 0.80242*height), control1: CGPoint(x: 0.21531*width, y: 0.91594*height), control2: CGPoint(x: 0.16521*width, y: 0.86464*height))
        path.addCurve(to: CGPoint(x: 0.18336*width, y: 0.7369*height), control1: CGPoint(x: 0.16521*width, y: 0.78495*height), control2: CGPoint(x: 0.1727*width, y: 0.75544*height))
        path.addLine(to: CGPoint(x: 0.21744*width, y: 0.67468*height))
        path.addLine(to: CGPoint(x: 0.47014*width, y: 0.67468*height))
        path.addLine(to: CGPoint(x: 0.47014*width, y: 0.91594*height))
        path.addLine(to: CGPoint(x: 0.27607*width, y: 0.91594*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.47867*width, y: 0.05897*height))
        path.addCurve(to: CGPoint(x: 0.41578*width, y: 0), control1: CGPoint(x: 0.4627*width, y: 0.03063*height), control2: CGPoint(x: 0.44137*width, y: 0.01093*height))
        path.addLine(to: CGPoint(x: 0.67801*width, y: 0))
        path.addCurve(to: CGPoint(x: 0.73028*width, y: 0.02843*height), control1: CGPoint(x: 0.70147*width, y: 0), control2: CGPoint(x: 0.71957*width, y: 0.00986*height))
        path.addLine(to: CGPoint(x: 0.7953*width, y: 0.14196*height))
        path.addLine(to: CGPoint(x: 0.86564*width, y: 0.09935*height))
        path.addLine(to: CGPoint(x: 0.75261*width, y: 0.30681*height))
        path.addLine(to: CGPoint(x: 0.52132*width, y: 0.30347*height))
        path.addLine(to: CGPoint(x: 0.59274*width, y: 0.26202*height))
        path.addLine(to: CGPoint(x: 0.47867*width, y: 0.05897*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.88275*width, y: 0.67687*height))
        path.addCurve(to: CGPoint(x: 0.96375*width, y: 0.65071*height), control1: CGPoint(x: 0.91469*width, y: 0.67687*height), control2: CGPoint(x: 0.94137*width, y: 0.66814*height))
        path.addLine(to: CGPoint(x: 0.83152*width, y: 0.88647*height))
        path.addCurve(to: CGPoint(x: 0.77933*width, y: 0.91594*height), control1: CGPoint(x: 0.82086*width, y: 0.90501*height), control2: CGPoint(x: 0.80171*width, y: 0.91594*height))
        path.addLine(to: CGPoint(x: 0.65455*width, y: 0.91594*height))
        path.addLine(to: CGPoint(x: 0.65455*width, y: height))
        path.addLine(to: CGPoint(x: 0.53516*width, y: 0.79587*height))
        path.addLine(to: CGPoint(x: 0.65455*width, y: 0.59169*height))
        path.addLine(to: CGPoint(x: 0.65455*width, y: 0.67687*height))
        path.addLine(to: CGPoint(x: 0.88275*width, y: 0.67687*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.98503*width, y: 0.48036*height))
        path.addCurve(to: CGPoint(x: width, y: 0.53604*height), control1: CGPoint(x: 0.99465*width, y: 0.49784*height), control2: CGPoint(x: width, y: 0.51638*height))
        path.addCurve(to: CGPoint(x: 0.94137*width, y: 0.63644*height), control1: CGPoint(x: width, y: 0.57535*height), control2: CGPoint(x: 0.97545*width, y: 0.61683*height))
        path.addCurve(to: CGPoint(x: 0.88062*width, y: 0.65071*height), control1: CGPoint(x: 0.92536*width, y: 0.64523*height), control2: CGPoint(x: 0.90294*width, y: 0.65071*height))
        path.addLine(to: CGPoint(x: 0.81019*width, y: 0.65071*height))
        path.addLine(to: CGPoint(x: 0.68445*width, y: 0.42795*height))
        path.addLine(to: CGPoint(x: 0.88806*width, y: 0.30895*height))
        path.addLine(to: CGPoint(x: 0.98503*width, y: 0.48036*height))
        path.closeSubpath()
        return path
    }
}

