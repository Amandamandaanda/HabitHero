//
//  WeekView.swift
//  HabitHero
//
//  Created by Amanda Tana on 2026-04-29.
//

import SwiftUI

struct WeekView: View {
    
    let habits: [Habit]
    let viewModel: HabitViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(week, id: \.self) { date in
                    WeekDayView(date: date, isToday: Calendar.current.isDateInToday(date), completedCount: viewModel.completedHabits(for: date, habits: habits))
                }
            }
        }
        .padding(.horizontal)
        
    }
    private var week: [Date] {
        let calendar = Calendar.current
        
        let startOfWeek = calendar.dateInterval(of: .weekOfYear, for: Date())?.start ?? Date()
        return (0..<7).compactMap { calendar.date(byAdding: .day, value: $0, to: startOfWeek)}
    }

}
