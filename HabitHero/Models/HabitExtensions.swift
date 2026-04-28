//
//  HabitExtensions.swift
//  HabitHero
//
//  Created by Amanda Tana on 2026-04-27.
//

import Foundation

extension Habit {
    
        
        var isCompletedToday: Bool {
            let calendar = Calendar.current
            return completedDays.contains {
                calendar.isDateInToday($0)
            }
        }
        
    var currentStreak: Int {
        let calendar = Calendar.current
        
        let uniqueDays = Set(completedDays.map{ calendar.startOfDay(for: $0) })
        let sortedDays = uniqueDays.sorted(by: >)
        
        guard let latest = sortedDays.first else {
            return 0
        }
        
        let today = calendar.startOfDay(for: Date())
        let daysSinceLastest = calendar.dateComponents([.day], from: latest, to: today).day ?? 0
        
        if daysSinceLastest > 1 {
            return 0
        }
        
        var streak = 1
        var excpected = calendar.date(byAdding: .day, value: -1, to: latest)!
        
        for day in sortedDays.dropFirst() {
            if day == excpected {
                streak += 1
                excpected = calendar.date(byAdding: .day, value: -1, to: excpected)!
            } else {
                break
            }
        }
        return streak
    }
}
