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
        HStack(spacing: 14) {
            Image(systemName: habit.isCompletedToday ? "checkmark.circle.fill" : "circle")
                .foregroundStyle(habit.isCompletedToday ? Color.accentColor : Color.secondaryTextColor)
                .font(.title3)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(habit.name)
                    .font(.headline)
                    .foregroundStyle(Color.primaryTextColor)
                    .lineLimit(1)
                
                Text("Streak \(habit.completedDays.count)")
                    .font(.caption)
                    .foregroundStyle(Color.secondaryTextColor)
            }
            
            Spacer()
            
            HStack(spacing: 4) {
                Image(systemName: "flame.fill")
                Text("\(habit.completedDays.count)")
            }
            .font(.caption)
            .foregroundStyle(Color.accentColor)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 10)
        .background(Color.listCardBackground)
        .clipShape(RoundedRectangle(cornerRadius: 14))
        .shadow(color: .black.opacity(0.5), radius: 4, y: 2)
        .contentShape(Rectangle())
 
        .onTapGesture {
            viewModel.toggleToday(for: habit, context: context)
        }
    }
}

