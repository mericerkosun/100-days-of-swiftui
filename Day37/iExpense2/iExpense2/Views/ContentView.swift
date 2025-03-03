//
//  ContentView.swift
//  iExpense2
//
//  Created by Meriç Erkoşun on 12.12.2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @State private var expenseViewModel = ExpenseItemViewModel()
    @State private var showingAddExpense = false
    
    @Environment(\.modelContext) var modelContext
    @Query var items: [ExpenseItem]
    
    var body: some View {
        NavigationStack {
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
        .onAppear{
            expenseViewModel.selectedCurrency = UserDefaults.standard.string(forKey: "latestCurrency") ?? "ERR"
        }
        .sheet(isPresented: $showingAddExpense) {
            AddView(expenseVM: expenseViewModel)
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        for index in offsets {
            let itemToDelete = items[index] // Silinecek öğeyi al
            modelContext.delete(itemToDelete) // ModelContext üzerinden sil
        }
    }
    
}

#Preview {
    ContentView()
}
