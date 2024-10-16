//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Meriç Erkoşun on 10.10.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var playerScore = 0
    @State private var qCount = 11
    
    @State private var moves = ["👊", "🫱", "✌️"]
    @State private var randomSelect = Int.random(in: 0...2)
    @State private var shouldWin = Bool.random()
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.white, .indigo], startPoint: .top, endPoint: .bottom)
            if qCount <= 10 {
                VStack (spacing: 10) {
                    Spacer()
                    Spacer()
                    Text("\(playerScore)")
                        .font(.title)
                    Text("Question \(qCount)")
                        .font(.title2)
                    Spacer()
                    Text(moves[randomSelect])
                        .font(.system(size: 80))
                    Text(shouldWin ? "Win" : "Lose")
                        .font(.title)
                    Spacer()
                    ForEach(0..<3) { number in
                        Button("\(moves[number])") {
                            let answer = game(move: moves[randomSelect], challenge: shouldWin)
                            if ( qCount <= 10) {
                                if(moves[number] == answer) {
                                    playerScore += 1
                                    next()
                                } else {
                                    playerScore -= 1
                                    next()
                                }
                            } else {
                                
                            }
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.orange)
                        .font(.system(size: 100))
                    }
                    Spacer()
                }
            } else {
                VStack (spacing: 50) {
                    Text("Game Over")
                        .font(.largeTitle)
                    Text("Your Score is")
                        .font(.title)
                    Text("\(playerScore)")
                        .font(.title2)
                    Button("Restart", action: restart)
                        .buttonStyle(.borderedProminent)
                        .tint(.green)
                        .font(.title)
                }
            }
        }
        .ignoresSafeArea()
    }
    
    func next() {
        qCount += 1
        randomSelect = Int.random(in: 0...2)
        shouldWin = Bool.random()
    }
    
    func restart() {
        qCount = 1
        playerScore = 0
        randomSelect = Int.random(in: 0...2)
        shouldWin = Bool.random()
    }
}

func game(move: String, challenge: Bool) -> String {
    
    var correctAnswer = ""
    
    if (challenge) {
        if (move == "👊") {
            correctAnswer = "🫱"
        } else if ( move == "🫱") {
            correctAnswer = "✌️"
        } else {
            correctAnswer = "👊"
        }
    } else {
        if (move == "👊") {
            correctAnswer = "✌️"
        } else if ( move == "🫱") {
            correctAnswer = "👊"
        } else {
            correctAnswer = "🫱"
        }
    }
    
    return correctAnswer
}

#Preview {
    ContentView()
}
