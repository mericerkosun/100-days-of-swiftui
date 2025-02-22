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
    var name: String
    var city: String
    var joinDate: Date
    
    init(name: String, city: String, joinDate: Date) {
        self.name = name
        self.city = city
        self.joinDate = joinDate
    }
}
