//
//  ContentView.swift
//  Animations
//
//  Created by Meriç Erkoşun on 10.11.2024.
//
import SwiftUI

struct Deneme: View {
    var name: String
    
    var body: some View {
        Rectangle()
            .fill(.red)
            .frame(width: 100, height: 100)
            .overlay(alignment: .center){
                Text(name)
            }
    }
}

struct Star: View {
    var color = Color.yellow
    
    var body: some View {
        Image(systemName: "star.fill")
            .foregroundStyle(color)
    }
}

import SwiftUI

struct ContentView: View {
    
    @State private var animationAmount = 1.0
    @State private var isScaled = false
    
    var body: some View {
        Color.blue
            .frame(width: 200, height: 200)
            .overlay {
                Circle()
                    .frame(width: 100, height: 100)
                Star()
            }

        VStack (spacing: 30) {
            Text("PREMIUM")
                .foregroundStyle(.white)
                .frame(width: 300, height: 175)
                .background(.black)
                .font(.system(.largeTitle,weight: .bold))
                .overlay {
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(LinearGradient(colors: [.blue, .purple], startPoint: .leading, endPoint: .trailing), lineWidth: 5)
                        .shadow(color: Color.teal.opacity(0.9), radius: 10)
                        .frame(width: 225, height: 75)
                }
            
            Button("Tap me") {
                        isScaled.toggle()
                    }
                    .padding(40)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .scaleEffect(isScaled ? 1.5 : 1.0)
                    .animation(.spring(), value: isScaled)
                    .padding(.bottom, 35)
            
            Button("TAP ME") {
//                animationAmount += 1
                }
                .padding(50)
                .background(.red)
                .foregroundStyle(.white)
                .clipShape(.circle)
//              .scaleEffect(animationAmount)
//              .blur(radius: (animationAmount - 1) * 3)
                .overlay {
                    Circle()
                        .stroke(.orange)
                        .scaleEffect(animationAmount)
                        .opacity(2 - animationAmount)
                        .animation(
                            .easeOut(duration: 1)
        //                  .delay(1)
//                          .repeatCount(3, autoreverses: true),
                                .repeatForever(autoreverses: false),
                            value: animationAmount)
                }
                .onAppear {
                    animationAmount = 2
                }
        }
        .padding()
        
//        var body: some View {
//            VStack {
//                Deneme(name: "Beyz")
//                Spacer()
//                RoundedRectangle(cornerRadius: 8)
//                    .frame(width: 200, height: 100)
//                    .overlay(alignment: .topLeading) { Star(color: .red) }
//                    .overlay(alignment: .topTrailing) { Star(color: .yellow) }
//                    .overlay(alignment: .bottomLeading) { Star(color: .green) }
//                    .overlay(alignment: .bottomTrailing) { Star(color: .blue) }
//                Spacer()
//                Circle()
//                    .fill(.yellow)
//                    .frame(width: 200, height: 200)
//                    .overlay(
//                        Circle()
//                            .stroke(Color.black, lineWidth: 5)
//                            .scaleEffect(x: 1.5, y: 0.8, anchor: .topLeading)
//                            .opacity(1)
//                    )
//            }
//            .padding()
//        }
    }
}

#Preview {
    ContentView()
}
