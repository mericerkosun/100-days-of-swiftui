//
//  ExpensesView.swift
//  iExpense2
//
//  Created by Meriç Erkoşun on 4.03.2025.
//

import SwiftData
import SwiftUI

struct ExpensesView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query var items: [ExpenseItem]
    @Bindable var expenseViewModel: ExpenseItemViewModel
    @Binding var showingAddExpense: Bool
    
    var body: some View {
        List {
            Section {
                Picker("Curency Type", selection: $expenseViewModel.selectedCurrency) {
                    ForEach(expenseViewModel.currencyDictionary.sorted(by: <), id: \.key) { key, value in
                        Text(key)
                    }
                }
            }
            
            ForEach(items) { item in // Buradaki \.id ExpenseItem property olandır. ExpenseItem structuna Identifiable protocol sağladığımız için burada id: kullanmaya gerek kalmadı.
                HStack {
                    VStack(alignment: .leading) {
                        Text(item.name)
                            .font(.headline)
                        Text(item.type)
                    }

                    Spacer()

                    Group {
                        if item.amount < 10 {
                            Text(item.amount, format: .currency(code: expenseViewModel.currencyDictionary[item.currencyType] ?? "ERR"))
                                .foregroundStyle(Color.green)
                        } else if item.amount < 100 {
                            Text(item.amount, format: .currency(code: expenseViewModel.currencyDictionary[item.currencyType] ?? "ERR"))
                                .foregroundStyle(Color.orange)
                        } else {
                            Text(item.amount, format: .currency(code: expenseViewModel.currencyDictionary[item.currencyType] ?? "ERR"))
                                .foregroundStyle(Color.red)
                        }
                    }
                }
            }
            .onDelete(perform: removeItems)
        }
        .toolbar {
            Button("Add Expense", systemImage: "plus") {
                showingAddExpense = true
            }
        }
        .navigationTitle("iExpense")
    }
    
    func removeItems(at offsets: IndexSet) {
        for index in offsets {
            let itemToDelete = items[index] // Silinecek öğeyi al
            modelContext.delete(itemToDelete) // ModelContext üzerinden sil
        }
    }
}

#Preview {
    ExpensesView(expenseViewModel: ExpenseItemViewModel(), showingAddExpense: .constant(false))
}
