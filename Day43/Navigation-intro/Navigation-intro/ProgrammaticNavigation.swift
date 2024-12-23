//
//  ProgrammaticNavigation.swift
//  Navigation-intro
//
//  Created by Meriç Erkoşun on 22.12.2024.
//

import SwiftUI

struct ProgrammaticNavigation: View {
    
    @State private var path = [Int]()
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Button("Show 32") {
                    path = [32]
                }
                
                Button("Show 64") {
                    path = [64]
                }
                Button("Show 32 than 64") {
                    path = [32,64]
                }
            }
            .navigationDestination(for: Int.self) { selection in
                Text("You selected \(selection)")
            }
        }
    }
}

#Preview {
    ProgrammaticNavigation()
}
