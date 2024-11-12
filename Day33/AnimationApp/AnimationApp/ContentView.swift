//
//  ContentView.swift
//  AnimationApp
//
//  Created by Meriç Erkoşun on 12.11.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var enabled = false
    
    var body: some View {
        
        VStack {
            Button("Tap Me") {
                enabled.toggle()
            }
            .frame(width: 200, height: 200)
            .foregroundStyle(.white)
            .background(enabled ? .blue : .red)
            .animation(nil, value: enabled)
            .clipShape(.rect(cornerRadius: enabled ? 60 : 0))
            .animation(.spring(duration: 1, bounce: 0.6), value: enabled)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
