//
//  ContentView.swift
//  WordScramble
//
//  Created by Meriç Erkoşun on 24.10.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var usedWords : [String] = []
    @State private var rootWord = ""
    @State private var newWord = ""
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    @State private var score = 0
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    TextField("Enter your word", text: $newWord)
                        .textInputAutocapitalization(.never)
                }
                
                Section {
                    ForEach(usedWords, id: \.self) { word in
                        HStack {
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                    }
                }
            }
            .navigationTitle(rootWord)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Restart") {
                        startGame()
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .status) {
                    Text("Score : \(score)")
                        .font(.title2)
                }
            }
        }
        .onSubmit(addNewWord)
        .onAppear(perform: startGame)
        .alert(errorTitle, isPresented: $showingError) {
            Button("OK") { }
        } message: {
            Text(errorMessage)
        }
    }
    
    func addNewWord() {
        
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard answer.count > 0 else { return }
        
        guard shorterThan3(word: answer) else {
            wordError(title: "Invalid input", message: "Your answer can't be less than 3 characters or same as start word.")
            newWord = ""
            return
        }
        
        guard isOriginal(word: answer) else {
            wordError(title: "Word used already", message: "Be more original")
            newWord = ""
            return
        }
        
        guard isPossible(word: answer) else {
            wordError(title: "Word not possible", message: "You can't spell that word from \(rootWord)!")
            newWord = ""
            return
        }
        
        guard isReal(word: answer) else {
            wordError(title: "Word not recognized", message: "You can't just make them up, you know!")
            newWord = ""
            return
        }
        
        withAnimation {
            usedWords.insert(answer, at: 0)
        }
        
        score += 1
        
        newWord = ""
    }
    
    func startGame() {
        if let fileURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let fileContents = try? String(contentsOf: fileURL, encoding: .utf8) {
                let wordArray = fileContents.components(separatedBy: "\n")
                rootWord = wordArray.randomElement() ?? "silkworm"
                usedWords = []
                score = 0
                return
            }
        }
        
        // if we are *here* then there was a problem - trigger a crash and report error
        fatalError("Could not load start.txt from bundle.")
    }
    
    
    func isOriginal(word : String) -> Bool {
        return !usedWords.contains(word)
    }
    
    
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }
        
        return true
    }
    
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        return misspelledRange.location == NSNotFound
    }
    
    
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
    
    func shorterThan3(word: String) -> Bool {
        
        if word.count < 3 {
            return false
        }
        if (word == rootWord) {
            return false
        }
        
        return true
    }
}

#Preview {
    ContentView()
}
