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
    var ID: UUID
    var streak: Int
    var name: String
    var lastPerformed: Date
    
    init(ID: UUID, streak: Int, name: String, lastPerformed: Date) {
        self.ID = ID
        self.streak = streak
        self.name = name
        self.lastPerformed = lastPerformed
    }
    
}
