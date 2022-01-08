//
//  ScrollOffsetPreferenceKey.swift
//  Ultimate Plant & Seed Organiser
//
//  Created by David Power on 9/1/2022.
//

import SwiftUI

@available(iOS 13.0, *)
struct ScrollOffsetPreferenceKey: PreferenceKey {
    typealias Value = [CGFloat]
    
    static var defaultValue: [CGFloat] = [0]
    
    static func reduce(value: inout [CGFloat], nextValue: () -> [CGFloat]) {
        value.append(contentsOf: nextValue())
    }
}
