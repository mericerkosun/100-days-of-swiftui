//
//  iExpense2App.swift
//  iExpense2
//
//  Created by Meriç Erkoşun on 12.12.2024.
//

import SwiftData
import SwiftUI

@main
struct iExpense2App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: ExpenseItem.self)
    }
}
