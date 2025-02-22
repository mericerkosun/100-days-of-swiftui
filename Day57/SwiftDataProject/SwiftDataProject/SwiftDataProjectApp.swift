//
//  SwiftDataProjectApp.swift
//  SwiftDataProject
//
//  Created by Meriç Erkoşun on 22.02.2025.
//

import SwiftData
import SwiftUI

@main
struct SwiftDataProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
