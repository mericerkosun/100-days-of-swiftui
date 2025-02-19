//
//  Student.swift
//  IntroToSwiftData
//
//  Created by Meriç Erkoşun on 19.02.2025.
//

import SwiftData
import Foundation

@Model
class Student {
    var id: UUID
    var name: String
    
    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
}
