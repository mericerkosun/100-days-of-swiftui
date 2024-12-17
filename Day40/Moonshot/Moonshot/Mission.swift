//
//  Mission.swift
//  Moonshot
//
//  Created by Meriç Erkoşun on 17.12.2024.
//

import Foundation

struct Mission: Codable, Identifiable {
    
//  Our CrewRole struct was made specifically to hold data about missions, and as a result we can actually put the CrewRole struct inside the Mission struct like this: This is called a nested struct.
    struct CrewRole: Codable {
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String {
        "Apollo \(id)"
    }

    var image: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
}
