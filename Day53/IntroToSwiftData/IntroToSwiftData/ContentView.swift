//
//  ContentView.swift
//  IntroToSwiftData
//
//  Created by Meriç Erkoşun on 19.02.2025.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    
    @Query var students: [Student]
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        NavigationStack {
            List(students) { student in
                Text(student.name)
            }
            .toolbar {
                Button("Add"){
                    let firstNames = ["Ginny", "Harry", "Hermione", "Luna", "Ron"]
                    let lastNames = ["Granger", "Lovegood", "Potter", "Weasley"]
                    
                    let choosenFirstName = firstNames.randomElement()!
                    let choosenLastName = lastNames.randomElement()!
                    
                    let student = Student(id: UUID(), name: "\(choosenFirstName) \(choosenLastName)")
                    
                    modelContext.insert(student)
                }
            }
            .navigationTitle("Classroom")
        }
    }
}

#Preview {
    ContentView()
}
