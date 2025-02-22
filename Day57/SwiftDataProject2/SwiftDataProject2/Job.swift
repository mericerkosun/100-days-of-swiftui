//
//  Job.swift
//  SwiftDataProject2
//
//  Created by Meriç Erkoşun on 22.02.2025.
//

import Foundation
import SwiftData

@Model
class Job {
    var name: String = "None"
    var priority: Int = 1
    var owner: User?
    
    init(name: String, priority: Int, owner: User? = nil) {
        self.name = name
        self.priority = priority
        self.owner = owner
    }
}
