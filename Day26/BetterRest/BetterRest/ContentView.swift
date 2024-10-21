//
//  ContentView.swift
//  BetterRest
//
//  Created by Meriç Erkoşun on 18.10.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date.now
    
    var body: some View {
        Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
            .padding()
        
        DatePicker("Please enter a date", selection: $wakeUp, in: Date.now...)
            .labelsHidden()
            .padding()
    }
}

#Preview {
    ContentView()
}
