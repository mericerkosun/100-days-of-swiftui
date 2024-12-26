//
//  AstronautView.swift
//  MoonshotChallenge
//
//  Created by Meriç Erkoşun on 26.12.2024.
//

import SwiftUI

struct AstronautView: View {
    
    let member: CrewMember
    
    init(member: CrewMember) {
        self.member = member
    }
    
    var body: some View {
        ScrollView {
            VStack {
                Image(member.astronaut.id)
                    .resizable()
                    .scaledToFit()
                
                Text(member.astronaut.description)
                    .padding()
            }
        }
        .background(.darkBackground)
        .navigationTitle(member.astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let ekipUyesi = CrewMember(role: "Kaptan", astronaut: astronauts["white"]!)
    
    return AstronautView(member: ekipUyesi)
        .preferredColorScheme(.dark)
}
