//
//  ContentView.swift
//  Moonshot-intro
//
//  Created by Meriç Erkoşun on 16.12.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(.homeBg) // "home-bg"
                .resizable()
                .scaledToFill()
                .containerRelativeFrame(.horizontal) { size, axis in
                    size * 0.8
                }
//                .clipped()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
