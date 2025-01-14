//
//  HapticEffects.swift
//  CupcakeCorner-1
//
//  Created by Meriç Erkoşun on 14.01.2025.
//

import SwiftUI

struct HapticEffects: View {
    @State private var counter = 0
    
    var body: some View {
        Button("Tap Count: \(counter)") {
            counter += 1
        }
        .sensoryFeedback(.increase, trigger: counter)
        
        // If you want a little more control over your haptic effects, there's an alternative called .impact(), which has two variants: one where you specify how flexible your object is and how strong the effect should be, and one where you specify a weight and intensity.
        
//        For example, we could request a middling collision between two soft objects:
//        .sensoryFeedback(.impact(flexibility: .soft, intensity: 0.5), trigger: counter)
        
//        Or we could specify an intense collision between two heavy objects:
//        .sensoryFeedback(.impact(weight: .heavy, intensity: 1), trigger: counter)
    }
}

#Preview {
    HapticEffects()
}
