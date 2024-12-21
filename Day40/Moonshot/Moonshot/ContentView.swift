//
//  ContentView.swift
//  Moonshot
//
//  Created by Meriç Erkoşun on 17.12.2024.
//

import SwiftUI

struct ContentView: View {
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    @State private var gridChoice = false
    
    var body: some View {
        NavigationStack {
            VStack {
                if gridChoice {
                    ScrollView {
                        LazyVGrid(columns: columns) {
                            ForEach(missions) { mission in
                                NavigationLink {
                                    MissionView(mission: mission, astronauts: astronauts)
                                } label: {
                                    VStack {
                                        Image(mission.image)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 100, height: 100)
                                            .padding()
                                        
                                        VStack {
                                            Text(mission.displayName)
                                                .font(.headline)
                                                .foregroundStyle(.white)
                                            Text(mission.formattedLaunchDate)
                                                .font(.caption)
                                                .foregroundStyle(.white.opacity(0.5))
                                        }
                                        .padding(.vertical)
                                        .frame(maxWidth: .infinity)
                                        .background(.lightBackground)
                                    }
                                    .clipShape(.rect(cornerRadius: 10))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(.lightBackground)
                                    )
                                }
                            }
                        }
                        .padding([.horizontal,.bottom])
                    }
                    .navigationTitle("Moonshot")
                    .background(.darkBackground)
                    .preferredColorScheme(.dark)
                } else {
                    List {
                        ForEach(missions) { mission in
                            NavigationLink {
                                MissionView(mission: mission, astronauts: astronauts)
                            } label: {
                                HStack {
                                    Image(mission.image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100, height: 100)
                                        .padding()
                                    
                                    VStack {
                                        Text(mission.displayName)
                                            .font(.headline)
                                            .foregroundStyle(.white)
                                        Text(mission.formattedLaunchDate)
                                            .font(.caption)
                                            .foregroundStyle(.white.opacity(0.5))
                                    }
//                                    .padding(.vertical)
                                    .frame(maxWidth: .infinity)
//                                    .background(.lightBackground)
                                }
                            }
                            .padding()
                        }
                        .clipShape(.rect(cornerRadius: 10))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.lightBackground)
                        )
                        .background(.darkBackground)
                    }
                    .scrollContentBackground(.hidden)
                    .background(.darkBackground)
                    .navigationTitle("Moonshot")
                    .preferredColorScheme(.dark)
                }
            }
            .toolbar {
                Button {
                    gridChoice.toggle()
                } label: {
                    Text(gridChoice ? "List" : "Grid")
                        .foregroundStyle(.white)
                        .font(.headline)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
