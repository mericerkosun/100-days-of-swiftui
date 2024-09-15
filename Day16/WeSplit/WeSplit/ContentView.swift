//
//  ContentView.swift
//  WeSplit
//
//  Created by Meriç Erkoşun on 13.09.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberofPeople = 2
    @State private var tipPercetage = 15
    @FocusState private var amountIsFocused: Bool
    
    var totalPerPerson: Double {
        let personCount = Double(numberofPeople + 2)
        let tipSelection = Double(tipPercetage)
        
        let totalGrade = checkAmount + (checkAmount * tipSelection / 100)
        let amountPerPerson = totalGrade / personCount
        return amountPerPerson
    }
    
    var totalAmount: Double {
        return checkAmount + ( checkAmount * Double(tipPercetage) / 100)
    }
    
    let tipPercenrages = [0,5,10,15,20,25]
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of People", selection: $numberofPeople){
                        ForEach(2..<51) {
                            Text("\($0) people")
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                
                Section("How much do you want to tip?") {
                    Picker("Tip Percentage", selection: $tipPercetage) {
                        ForEach(tipPercenrages, id: \.self) {
                            Text($0,format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Amount per person") {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                
                Section("Total Amount") {
                    Text(totalAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
