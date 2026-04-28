//
//  HabitRow.swift
//  HabitHero
//
//  Created by Amanda Tana on 2026-04-28.
//

import SwiftUI
import SwiftData


struct HabitRow: View {
    
    let habit: Habit
    let viewModel: HabitViewModel
    let context: ModelContext
    
    var body: some View {
        HStack {
            Image(systemName: habit.isCompletedToday ? "checkmark.circle.fill" : "circle")
                .foregroundStyle(habit.isCompletedToday ? .green : .secondary)
            
            
            
            Text(habit.name)
                .font(.headline)
            
            Spacer()
            
            Text("Streak \(habit.completedDays.count)")
            //    .font(.subheadline)
                .foregroundStyle(.secondary)
            
        }
        .onTapGesture {
            viewModel.toggleToday(for: habit, context: context)
        }
                
        }
    }

