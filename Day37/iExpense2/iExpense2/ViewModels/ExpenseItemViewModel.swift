//
//  ExpenseItemViewModel.swift
//  iExpense2
//
//  Created by Meriç Erkoşun on 2.03.2025.
//

import Foundation

@Observable
class ExpenseItemViewModel {
    
    var selectedCurrency = "US Dollar"
    let currencyDictionary = ["Canadian Dollar": "CAD", "Euro": "EUR", "Japanese Yen": "JPY", "Russian Ruble": "RUB", "Turkish Lira": "TRY", "US Dollar": "USD"]
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
    }
    
    var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
}
