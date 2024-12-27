//
//  ContentView.swift
//  HabitTracker
//
//  Created by Meriç Erkoşun on 27.12.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var habitList = HabitList()
    @State private var addNewHabit = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(habitList.habits){ habit in
                    NavigationLink(value: habit){
                        HStack() {
                            VStack (alignment: .leading) {
                                Text("\(habit.name)")
                                    .fontWeight(.bold)
                                Text("\(habit.description)")
                            }
                            Spacer()
                            HStack {
                                Image(systemName: "flame")
                                    .foregroundStyle(.red)
                                    .font(.headline)
                                Text("\(habit.count)")
                                    .font(.headline)
                            }
                        }
                    }
                }
            }
            .sheet(isPresented: $addNewHabit) {
                SheetView(habitList: $habitList)
            }
            .navigationTitle("Habit Tracker")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                Button("New Habit") {
                    addNewHabit.toggle()
                }
            }
            .navigationDestination(for: Habit.self) { selection in
                if let index = habitList.habits.firstIndex(where: { $0.id == selection.id }) {
                    DetailView(selectedHabit: $habitList.habits[index])
                }
            }
        }
    }
}

struct SheetView: View {
    @Binding var habitList: HabitList
    
    @State private var name: String = ""
    @State private var description: String = ""
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            Spacer()
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 300, height: 200)
                    .foregroundStyle(.blue.opacity(0.3))
                    .overlay {
                        VStack(spacing: 20) {
                            TextField("Habit Name", text: $name)
                                .textFieldStyle(.roundedBorder)
                            TextField("Habit Description", text: $description)
                                .textFieldStyle(.roundedBorder)
                        }
                        .padding()
                    }
                
            }
            Spacer()
            Button("Save") {
                habitList.habits.append(Habit(name: name, description: description))
                dismiss()
            }
            .buttonStyle(.borderedProminent)
            .font(.title)
            .tint(.blue.opacity(0.5))
            
            Spacer()
            .navigationTitle("Add New Habit")
            .navigationBarTitleDisplayMode(.inline)
        }
        .padding()
    }
}

struct DetailView: View {
    @Binding var selectedHabit: Habit
    
    var body: some View {
        VStack (spacing: 50) {
            HStack {
                Image(systemName: "flame")
                    .font(.largeTitle)
                    .foregroundStyle(.red)
                Text("x\(selectedHabit.count)")
                    .font(.largeTitle)
            }
            
            VStack {
                Text("\(selectedHabit.name)")
                    .font(.title)
                Text("\(selectedHabit.description)")
            }
            
            Button(action: {
                selectedHabit.count += 1
            }) {
                HStack {
                    Image(systemName: "plus.circle.fill")
                    Text("Tamamlandı")
                }
                .font(.title2)
            }
            .buttonStyle(.borderedProminent)
            .tint(.blue.opacity(0.7))
        }
        .navigationTitle("Detaylar")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct Habit: Identifiable, Hashable, Codable {
    var id = UUID()
    var name: String
    var description: String
    var count: Int = 0
}

@Observable
class HabitList {
    var habits: [Habit] = [Habit(name: "Spor", description: "Koşu", count: 2),Habit(name: "Ders", description: ".NET Geliştirme", count: 3)]
}

#Preview {
    ContentView()
}
