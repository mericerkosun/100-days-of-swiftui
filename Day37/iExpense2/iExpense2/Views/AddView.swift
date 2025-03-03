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
    @Bindable var expenseVM: ExpenseItemViewModel
    @Environment(\.modelContext) var modelContext
    
    
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
                
                TextField("Amount", value: $amount, format: .currency(code: expenseVM.currencyDictionary[expenseVM.selectedCurrency] ?? "ERR"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Save") {
                    expenseVM.addExpense(name: name, type: type, amount: amount, currency: expenseVM.selectedCurrency, modelContext: modelContext)
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    AddView(expenseVM: ExpenseItemViewModel())
}
