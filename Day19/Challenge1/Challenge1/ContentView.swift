//
//  ContentView.swift
//  Challenge1
//
//  Created by Meriç Erkoşun on 16.09.2024.
//

import SwiftUI

func simpeBaseUnit(inputValue: Double, inputType: String, outputType: String) -> Double {
    
    var tempMeter: Double
    var final: Double
    
    switch inputType {
    case "kilometers":
        tempMeter = inputValue * 1000
    case "feet":
        tempMeter = inputValue * 0.3048
    case "yard":
        tempMeter = inputValue * 0.9144
    case "miles":
        tempMeter = inputValue * 1609.344
    case "meter":
        tempMeter = inputValue
    default:
        tempMeter = inputValue
    }
    
    switch outputType {
    case "kilometers":
        final = tempMeter / 1000
    case "feet":
        final = tempMeter * 3.28
    case "yard":
        final = tempMeter * 1.0936133
    case "miles":
        final = tempMeter * 0.000621371192
    case "meter":
        final = tempMeter
    default:
        final = tempMeter
    }
    
    return final
    
}

struct ContentView: View {
    
    private var inputType = ["meters", "kilometers", "feet", "yard", "miles"]
    @State private var selectedInputType = "meters"
    @State private var selectedOutputType = "meters"
    @State private var inputValue = 0.0
    var outputValue : Double {
        simpeBaseUnit(inputValue: inputValue, inputType: selectedInputType, outputType: selectedOutputType )
    }
    
    var body: some View {
        NavigationStack{
            Form{
                Section("Input Value"){
                    TextField("Input Value", value: $inputValue, format: .number)
                    Picker("Select Input Type", selection: $selectedInputType){
                        ForEach(inputType, id: \.self){
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section("Output Value"){
                    Picker("Select Output Type", selection: $selectedOutputType){
                        ForEach(inputType, id: \.self){
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    Text(outputValue.formatted())
                }
            }
            .navigationTitle("Length Conversion")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
