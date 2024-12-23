//
//  ContentView.swift
//  Navigation-intro
//
//  Created by Meriç Erkoşun on 22.12.2024.
//

import SwiftUI

struct ContentView: View {
    
    var students : [Student] = [Student(name: "Meriç", age: 23),Student(name: "Beyza", age: 23),Student(name: "Aşkın", age: 19),Student(name: "Mert", age: 17),Student(name: "Alp", age: 7)]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(students, id: \.id) { i in
                    NavigationLink("Select \(i.name)", value: i)
                }
                ForEach(1..<6) { i in
                    NavigationLink("Integer \(i)", value: i)
                }
                ForEach(1..<6) { i in
                    NavigationLink("String \(i)", value: String(i))
                }
            }
            .navigationDestination(for: Student.self) { selection in
                Text("You selected \(selection.name) - \(selection.age) years old")
            }
            .navigationDestination(for: Int.self) { selection in
                Text("You selected integer \(selection)")
            }
            .navigationDestination(for: String.self) { selection in
                Text("You selected string \(selection)")
            }
        }
    }
}

struct Student: Hashable {
    var id = UUID()
    var name: String
    var age: Int
}

struct DetailView: View {
    
    var number: Int
    
    var body: some View {
        Text("Detail View \(number)")
    }
    
    init(number: Int) {
        self.number = number
        print("Creating detail view \(number)")
    }
}

#Preview {
    ContentView()
}
