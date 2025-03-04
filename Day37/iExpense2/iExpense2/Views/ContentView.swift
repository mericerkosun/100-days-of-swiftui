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
    
    
    var body: some View {
        NavigationStack {
            ExpensesView(expenseViewModel: expenseViewModel, showingAddExpense: $showingAddExpense)
        }
        .onAppear{
            expenseViewModel.selectedCurrency = UserDefaults.standard.string(forKey: "latestCurrency") ?? "ERR"
        }
        .sheet(isPresented: $showingAddExpense) {
            AddView(expenseVM: expenseViewModel)
        }
    }
    
    
}

#Preview {
    ContentView()
}
