//
//  SwiftDataProject2App.swift
//  SwiftDataProject2
//
//  Created by Meriç Erkoşun on 22.02.2025.
//

import SwiftData
import SwiftUI

@main
struct SwiftDataProject2App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
