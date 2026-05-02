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
    private let calendar = Calendar.current
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(week, id: \.self) { date in
                        WeekDayView(date: date, isToday: Calendar.current.isDateInToday(date), completedCount: viewModel.completedHabits(for: date, habits: habits)
                        )
                        .id(date)
                    }
                }
                
                .padding(.horizontal)
                
            }
            .onAppear {
                if let today = week.first(where: { calendar.isDateInToday($0) }) {
                    proxy.scrollTo(today, anchor: .center)
                }
            }
        }
    }

    private var week: [Date] {
        let calendar = Calendar.current
        
        let startOfWeek = calendar.dateInterval(of: .weekOfYear, for: Date())?.start ?? Date()
        return (0..<7).compactMap { calendar.date(byAdding: .day, value: $0, to: startOfWeek)}
    }

}
