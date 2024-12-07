//
//  CodableUsage.swift
//  iExpense
//
//  Created by Meriç Erkoşun on 7.12.2024.
//

import SwiftUI

struct CodableUsage: View {
    
    @State private var user = TheUser(firstName: "Meriç", lastName: "Erkoşun")
    var body: some View {
        Button("Save User") {
            
            let encoder = JSONEncoder()
            
            if let data = try? encoder.encode(user) {
                UserDefaults.standard.set(data, forKey: "UserData")
            }
        }
    }
}

struct TheUser: Codable {
    let firstName: String
    let lastName: String
}

#Preview {
    CodableUsage()
}
