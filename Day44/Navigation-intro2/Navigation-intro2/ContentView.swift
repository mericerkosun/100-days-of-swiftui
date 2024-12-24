//
//  ContentView.swift
//  Navigation-intro2
//
//  Created by Meriç Erkoşun on 23.12.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var path = [Int]()
    
    var body: some View {
        NavigationStack(path: $path) {
            DetailView(number: 0,path: $path)
                .navigationDestination(for: Int.self) { i in
                    DetailView(number: i,path: $path)
                        .toolbar {
                            Button("Home") {
                                path.removeAll()
                            }
                        }
                }
        }
    }
}

struct DetailView: View {
    var number: Int
    @Binding var path: [Int]

    var body: some View {
        NavigationLink("Go to Random Number", value: Int.random(in: 1...1000))
            .navigationTitle("Number: \(number)")
    }
}


#Preview {
    ContentView()
}
