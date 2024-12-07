//
//  AppStorageUsage.swift
//  iExpense
//
//  Created by Meriç Erkoşun on 7.12.2024.
//

import SwiftUI

struct AppStorageUsage: View {
    @AppStorage("username") private var username: String = "Guest"
    @AppStorage("tapCount") private var tapCount = 0

    var body: some View {
        VStack {
            Text("Welcome, \(username)")
                .padding()

            TextField("Enter your name", text: $username)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            Button("Tap Count \(tapCount)"){
                tapCount += 1
            }
        }
    }
}

#Preview {
    AppStorageUsage()
}
