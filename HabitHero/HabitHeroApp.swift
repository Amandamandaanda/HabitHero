//
//  HabitHeroApp.swift
//  HabitHero
//
//  Created by Amanda Tana on 2026-04-27.
//

import SwiftUI
import SwiftData

@main
struct HabitHeroApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Habit.self)
    }
}
