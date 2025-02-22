//
//  User.swift
//  SwiftDataProject2
//
//  Created by Meriç Erkoşun on 22.02.2025.
//

import Foundation
import SwiftData

@Model
class User {
    var name: String = "Anonymus"
    var city: String = "Unknown"
    var joinDate: Date = Date.now
    @Relationship(deleteRule: .cascade) var jobs: [Job]? = [Job]()
    
    var unwrapJobs: [Job] {
        jobs ?? []
    }
    
    init(name: String, city: String, joinDate: Date) {
        self.name = name
        self.city = city
        self.joinDate = joinDate
    }
}
