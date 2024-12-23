//
//  NavigationPath.swift
//  Navigation-intro
//
//  Created by Meriç Erkoşun on 22.12.2024.
//

import SwiftUI

struct NavigationPathUsage: View {
    
    @State private var path = NavigationPath()
    
    var body: some View {
        
        NavigationStack(path: $path) {
            List {
//                ForEach(0..<5) { i in
//                    NavigationLink("Select Number: \(i)", value: i)
//                }
//
//                ForEach(0..<5) { i in
//                    NavigationLink("Select String: \(i)", value: String(i))
//                }
            }
            .toolbar {
                Button("Push 556") {
                    path.append(556)
                }

                Button("Push Hello") {
                    path.append("Hello")
                }
            }
            .navigationDestination(for: Int.self) { selection in
                Text("You selected the number \(selection)")
            }
            .navigationDestination(for: String.self) { selection in
                Text("You selected the string \(selection)")
            }
        }
        
    }
}

#Preview {
    NavigationPathUsage()
}
