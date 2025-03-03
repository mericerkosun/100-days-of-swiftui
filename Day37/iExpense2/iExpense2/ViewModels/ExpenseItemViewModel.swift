//
//  ExpenseItemViewModel.swift
//  iExpense2
//
//  Created by Meriç Erkoşun on 2.03.2025.
//

import Foundation
import SwiftData

@Observable
class ExpenseItemViewModel {
    
    var selectedCurrency = "US Dollar"
    let currencyDictionary = ["Canadian Dollar": "CAD", "Euro": "EUR", "Japanese Yen": "JPY", "Russian Ruble": "RUB", "Turkish Lira": "TRY", "US Dollar": "USD"]

    func addExpense(name: String, type: String, amount: Double, currency: String, modelContext: ModelContext) {
        let newExpense = ExpenseItem(name: name, type: type, amount: amount, currencyType: currency)
        modelContext.insert(newExpense)
    }
    
    
//    init() {
//        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
//            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
//                items = decodedItems
//                return
//            }
//        }
//    }
//    
//    var items = [ExpenseItem]() {
//        didSet {
//            if let encoded = try? JSONEncoder().encode(items) {
//                UserDefaults.standard.set(encoded, forKey: "Items")
//            }
//        }
//    }
}
