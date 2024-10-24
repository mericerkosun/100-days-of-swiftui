//
//  ContentView.swift
//  WordScramble
//
//  Created by Meriç Erkoşun on 24.10.2024.
//

import SwiftUI

struct ContentView: View {
    
    let people = ["Finn", "Leia", "Luke", "Rey"]
    
    var body: some View {
        List {
            Text("Static Row")

            ForEach(people, id: \.self) {
                Text($0)
            }

            Text("Static Row")
        }
        .listStyle(.grouped)
    }
}

#Preview {
    ContentView()
}
