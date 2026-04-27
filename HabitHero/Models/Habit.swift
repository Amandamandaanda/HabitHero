//
//  Habit.swift
//  HabitHero
//
//  Created by Amanda Tana on 2026-04-27.
//

import SwiftData
import Foundation

@Model
class Habit {
    var id: UUID
    var streak: [Date] = []
    var name: String

    
    init(name: String) {
        self.name = name
    }
    
}
