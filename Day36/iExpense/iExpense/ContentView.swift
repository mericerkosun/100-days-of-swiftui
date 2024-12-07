//
//  ContentView.swift
//  iExpense
//
//  Created by Meriç Erkoşun on 7.12.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingSheet = false
    
    var body: some View {
        VStack {
            Button("Show Sheet") {
                showingSheet.toggle()
            }
            .sheet(isPresented: $showingSheet) {
                SeconView(name: "merico")
            }
        }
        .padding()
    }
}

struct SeconView: View {
    
    @Environment(\.dismiss) var dismiss
    let name: String
    var body: some View {
        Text("Hello \(name)!")
        Button("Dismiss") {
            dismiss()
        }
    }
}

#Preview {
    ContentView()
}
