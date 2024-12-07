//
//  UserDefaultsUsage.swift
//  iExpense
//
//  Created by Meriç Erkoşun on 7.12.2024.
//

import SwiftUI

struct UserDefaultsUsage: View {
    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")

        var body: some View {
            Button("Tap count: \(tapCount)") {
                tapCount += 1
                UserDefaults.standard.set(tapCount, forKey: "Tap")
            }
        }
}

#Preview {
    UserDefaultsUsage()
}
