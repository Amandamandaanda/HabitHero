//
//  AddHabitViewModel.swift
//  HabitHero
//
//  Created by Amanda Tana on 2026-04-27.
//

import Foundation
import SwiftData

@Observable
class AddHabitViewModel {
    var habitName: String = ""
    var errorMessage: String?
    
    func saveHabit(context: ModelContext){
        let trimmed = habitName.trimmingCharacters(in: .whitespaces)
        
        guard !trimmed.isEmpty else {
            errorMessage = "You have to name a habit"
            return
        }
        let habit = Habit(name: trimmed)
        context.insert(habit)
        
        do {
            try context.save()
            errorMessage = nil
        } catch {
            errorMessage = "Failed to save"
        }
    }
    
}
