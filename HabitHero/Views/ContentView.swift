//
//  ContentView.swift
//  HabitHero
//
//  Created by Amanda Tana on 2026-04-27.
//

import SwiftUI
import SwiftData

struct ContentView: View {

    @Query(sort: \Habit.created, order: .reverse)
    private var habits: [Habit]

    @Environment(\.modelContext)
    private var modelContext

    @State private var habitName = ""
    @State private var showDeleted = false
     @State private var habitToDelete: Habit?
    
    var body: some View {

       NavigationStack {
            VStack {
                Text("Antal habits: \(habits.count)")
                HStack {
                    TextField("New habit....", text: $habitName)
                        .textFieldStyle(.roundedBorder)
                    
                    Button("Lägg till") {
                        let habit = Habit(name: habitName, date: Date())
                        modelContext.insert(habit)
                        habitName = ""
                    }
                    .disabled(habitName.trimmingCharacters(in: .whitespaces).isEmpty)
                }
                .padding()
                
                List {
                    ForEach(habits) {habit in
                            Text("\(habit.name)")
                            // TextField("Titel", text: Binding(
                            //     get: { habit.name },
                            //     set: { newValue in
                            //         habit.name = newValue
                            //         try? modelContext.save()
                            //     }
                            // ))
                        }
                    }
                }
                .navigationTitle("Habits")
                
                .alert("Är du säker på att du vill ta bort?", isPresented: $showDeleted) {
                    Button("Avbryt", role: .cancel) {}
                    
                    Button("Tabort", role: .destructive) {
                        if let habit = habitToDelete {
                            modelContext.delete(habit)
                            try? modelContext.save()
                        }
                    }
                }
                
            }
        }
    }


#Preview {
    ContentView()
}
