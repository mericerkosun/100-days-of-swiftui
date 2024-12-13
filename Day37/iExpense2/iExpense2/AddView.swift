//
//  AddView.swift
//  iExpense2
//
//  Created by Meriç Erkoşun on 12.12.2024.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    var expensesOh: Expenses
    var currency: Currency
    
    
    let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Amount", value: $amount, format: .currency(code: currency.currencyDictionary[currency.selectedCurrency] ?? "ERR"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Save") {
                    let item = ExpenseItem(name: name, type: type, amount: amount, currencyType: currency.currencyDictionary[currency.selectedCurrency] ?? "ERR")
                    expensesOh.items.append(item)
                    UserDefaults.standard.set(currency.selectedCurrency, forKey: "latestCurrency")
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    AddView(expensesOh: Expenses(), currency: Currency())
}
