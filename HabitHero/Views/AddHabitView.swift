//
//  AddHabitView.swift
//  HabitHero
//
//  Created by Amanda Tana on 2026-04-27.
//

import SwiftUI
import SwiftData

struct AddHabitView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    @State private var newHabitName: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("New habit...", text: $newHabitName)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                
                Button("Save") {
                    let habit = Habit(name: newHabitName, date: Date())
                    modelContext.insert(habit)
                    
                    dismiss()
                }
                .disabled(newHabitName.trimmingCharacters(in: .whitespaces).isEmpty)
                
                Spacer()
            }
            .navigationTitle("New habit")
            
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button ("Cancel") {
                        dismiss()
                    }
                }
            }
        }
        
    }
}
