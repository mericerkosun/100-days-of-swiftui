//
//  ContentView.swift
//  Animations2
//
//  Created by Meriç Erkoşun on 11.11.2024.
//
//

import SwiftUI

struct ContentView: View {
    
    @State private var animationAmount = 1.0
    
    var body: some View {
        print(animationAmount)
        
        return VStack {
            Stepper("Scale Amount", value: $animationAmount.animation(.easeInOut(duration: 1).repeatCount(3,autoreverses: true)), in: 1...10)
            Spacer()
            Button("Tap Me") {
                animationAmount += 1
            }
            .padding(40)
            .background(.red)
            .foregroundStyle(.white)
            .clipShape(.circle)
            .scaleEffect(animationAmount)
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
