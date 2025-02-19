//
//  IntroToSwiftDataApp.swift
//  IntroToSwiftData
//
//  Created by Meriç Erkoşun on 19.02.2025.
//

import SwiftData
import SwiftUI

@main
struct IntroToSwiftDataApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Student.self)
        }
    }
}
