//
//  ExpenseItem.swift
//  iExpense2
//
//  Created by Meriç Erkoşun on 2.03.2025.
//

import Foundation

@Observable
class ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
    let currencyType: String
    
    init(id: UUID = UUID(), name: String, type: String, amount: Double, currencyType: String) {
        self.id = id
        self.name = name
        self.type = type
        self.amount = amount
        self.currencyType = currencyType
    }
}
