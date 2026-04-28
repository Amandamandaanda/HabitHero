//
//  HabitViewModel.swift
//  HabitHero
//
//  Created by Amanda Tana on 2026-04-27.
//

import Foundation
import SwiftData

@Observable
class HabitViewModel {
    
     func deleteHabit(at offsets: IndexSet, habits: [Habit], context: ModelContext) {
        for index in offsets {
            let habit = habits[index]
            context.delete(habit)
        }
        try? context.save()
    }
}
