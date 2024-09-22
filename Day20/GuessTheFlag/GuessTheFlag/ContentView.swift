//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Meriç Erkoşun on 17.09.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var countries = ["Estonia","France","Germany","Ireland","Italy","Monaco","Nigeria","Poland","Spain","UK","Ukraine","US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var userScore = 0
    @State private var wrongMessage = ""
    @State private var count = 1
    @State private var isGameOver = false
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
            VStack {
                Spacer()
                Text("Guess The Flag")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                VStack(spacing: 15){
                    VStack{
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            
                            flagTapped(number)
                            
                        } label: {
                            Image(countries[number])
                                .clipShape(.capsule)
                                .shadow(radius: 5)
                        }	
                    }
                }
                .frame(maxWidth:.infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                Spacer()
                Spacer()
                
                if(count < 9) {
                    Text("Score: \(userScore)")
                        .foregroundStyle(.white)
                        .font(.title.bold())
                } else {
                    Text("Game Over.\nYour score is : \(userScore)")
                        .foregroundStyle(.white)
                        .font(.title.bold())
                }
                
                Spacer()
                if(count<9){
                    Text("Question \(count)/8")
                } else {
                    Text("Question 8/8")
                }
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Countinue", action: askQuestion)
        } message: {
            if(count <= 8) {
                if scoreTitle == "Correct" {
                    Text("Your score is \(userScore)")
                } else {
                    Text("\(wrongMessage)\nYour score is \(userScore).")
                }
            }
        }
        .alert("Game Over. Your score is \(userScore)", isPresented: $isGameOver){
            Button("Restart", action: restart)
        } message: {
            Text("Do you want to play again?")
        }
    }
    
    func flagTapped(_ number: Int){
        if number == correctAnswer {
            scoreTitle = "Correct"
            userScore += 1
        } else {
            scoreTitle = "Wrong"
            userScore -= 1
            wrongMessage = "Wrong! That's the flag of \(countries[number])."
        }
        showingScore = true
    }
    
    func askQuestion(){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        count += 1
        if(count == 9){
            isGameOver = true
        }
        
    }
    
    func restart(){
        showingScore = false
        scoreTitle = ""
        userScore = 0
        wrongMessage = ""
        count = 1
        isGameOver = false
    }
}

#Preview {
    ContentView()
}
