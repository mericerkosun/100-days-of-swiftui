//
//  ContentView.swift
//  WeSplit
//
//  Created by Meriç Erkoşun on 13.09.2024.
//

import SwiftUI

struct ContentView: View {
    var students = ["Harry","Hermonie","Ron"]
    @State private var selectedStudent = "Harry"
    
    var body: some View {
        Form {
            Picker("Select your student", selection: $selectedStudent) {
                ForEach(students, id: \.self){
                        Text($0)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
