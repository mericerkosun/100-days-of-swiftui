//
//  ContentView.swift
//  SwiftDataProject2
//
//  Created by Meriç Erkoşun on 22.02.2025.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query(filter: #Predicate<User> { user in
        user.name.localizedStandardContains("a") &&
        user.city == "Madrid"
    }, sort: \User.name) var users: [User]
    
    var body: some View {
        NavigationStack {
            List(users) { user in
                Text(user.name)
            }
            .navigationTitle("Users")
            .toolbar {
                Button("Add Samples", systemImage: "plus") {
                    try? modelContext.delete(model: User.self)
                    
                    let first = User(name: "A.Nwakaeme", city: "Trabzon", joinDate: .now.addingTimeInterval((86400 * -10)))
                    let second = User(name: "A.Sorloth", city: "Madrid", joinDate: .now.addingTimeInterval((86400 * -5)))
                    let third = User(name: "J.Sosa", city: "Buenos Aires", joinDate: .now.addingTimeInterval((86400 * 5)))
                    let fourth = User(name: "C.Ekuban", city: "Genoa", joinDate: .now.addingTimeInterval((86400 * 10)))
                    
                    modelContext.insert(first)
                    modelContext.insert(second)
                    modelContext.insert(third)
                    modelContext.insert(fourth)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
