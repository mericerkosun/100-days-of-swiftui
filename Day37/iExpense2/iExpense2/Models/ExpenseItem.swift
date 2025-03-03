//
//  ExpenseItem.swift
//  iExpense2
//
//  Created by Meriç Erkoşun on 2.03.2025.
//

import Foundation
import SwiftData


@Model
class ExpenseItem: Identifiable {
    var id = UUID()
    var name: String
    var type: String
    var amount: Double
    var currencyType: String
    
    init(id: UUID = UUID(), name: String, type: String, amount: Double, currencyType: String) {
        self.id = id
        self.name = name
        self.type = type
        self.amount = amount
        self.currencyType = currencyType
    }
}
