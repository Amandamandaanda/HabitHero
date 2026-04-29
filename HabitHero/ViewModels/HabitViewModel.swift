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
    
    var errorMessage: String?
    
    func completedHabits(for date: Date, habits: [Habit]) -> Int {
       return habits.filter{ habit in
            habit.completedDays.contains{
                Calendar.current.isDate($0, inSameDayAs: date)
            }
        }.count
    }

    func toggleToday(for habit: Habit, context: ModelContext) {
        let calendar = Calendar.current

        if let todayIndex = habit.completedDays.firstIndex(where: {
            calendar.isDateInToday($0)
        }) {
            habit.completedDays.remove(at: todayIndex)
        } else {
            habit.completedDays.append(Date())
        }

        do {
            try context.save()
        } catch {
            errorMessage = "Failed to save: \(error.localizedDescription)"
        }
    }
    
     func deleteHabit(at offsets: IndexSet, habits: [Habit], context: ModelContext) {
        for index in offsets {
            let habit = habits[index]
            context.delete(habit)
        }
        try? context.save()
    }
    
    
}
