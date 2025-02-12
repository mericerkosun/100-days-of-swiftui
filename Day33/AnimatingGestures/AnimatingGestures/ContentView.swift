//
//  ContentView.swift
//  AnimatingGestures
//
//  Created by Meriç Erkoşun on 12.11.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var dragAmount = CGSize.zero
    
    let letters = Array("Hello SwiftUI")
    @State private var enabled = false
    
    var body: some View {
//        VStack {
//            LinearGradient(colors: [.yellow, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
//                .frame(width: 300, height: 200)
//                .clipShape(.rect(cornerRadius: 10))
//                .offset(dragAmount)
//                .gesture(
//                    DragGesture()
//                        .onChanged { dragAmount = $0.translation }
//                        .onEnded { _ in
//                            withAnimation(.bouncy) {
//                                dragAmount = .zero
//                            }
//                        }
//                )
//            //                .animation(.bouncy, value: dragAmount)
//        }
            HStack(spacing: 0) {
                ForEach(0..<letters.count, id: \.self) { num in
                    Text(String(letters[num]))
                        .padding(5)
                        .font(.title)
                        .background(enabled ? .blue : .red)
                        .offset(dragAmount)
                        .animation(.linear.delay(Double(num) / 20), value: dragAmount)
                }
            }
            .gesture(
                DragGesture()
                    .onChanged { dragAmount = $0.translation}
                    .onEnded { _ in
                        dragAmount = .zero
                        enabled.toggle()
                    }
            )
    }
}

#Preview {
    ContentView()
}
