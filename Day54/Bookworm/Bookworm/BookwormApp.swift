//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Meriç Erkoşun on 20.02.2025.
//

import SwiftUI
import SwiftData

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
