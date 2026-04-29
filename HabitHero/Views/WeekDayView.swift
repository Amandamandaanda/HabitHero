//
//  WeekDayView.swift
//  HabitHero
//
//  Created by Amanda Tana on 2026-04-29.
//

import SwiftUI

struct WeekDayView: View {
    
    let date: Date
    let isToday: Bool
    let completedCount: Int
    
    var body: some View {
        VStack(spacing: 6) {
            Text(date.formatted(.dateTime.day()))
                .font(.headline)
            
            Text(date.formatted(.dateTime.weekday(.abbreviated)))
                .font(.caption)
            
            Text("\(completedCount)")
                .font(.caption2)
            
        }
        .frame(width: 60, height: 80)
        .background(isToday ? Color.purple : Color.gray.opacity(0.1))
        .foregroundStyle(isToday ? .white : .primary)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}
