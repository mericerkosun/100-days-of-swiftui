//
//  ContentView.swift
//  Animations3
//
//  Created by Meriç Erkoşun on 11.11.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var animationAmount = 0.0
    
    var body: some View {
        VStack {
            Button("Tap Me") {
                withAnimation (.spring(duration: 1, bounce: 0.5)) {
                    animationAmount += 360
                }
            }
            .padding(50)
            .background(.red)
            .foregroundStyle(.white)
            .clipShape(.circle)
            .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y:0, z:1))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
