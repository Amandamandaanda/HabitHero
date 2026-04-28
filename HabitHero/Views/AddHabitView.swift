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
    
    @State private var viewModel = AddHabitViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("New habit...", text: $viewModel.habitName)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                
                if let error = viewModel.errorMessage {
                    Text(error)
                        .foregroundStyle(.red)
                        .font(.caption)
                }
                
                Button("Save") {
                    viewModel.saveHabit(context: modelContext)
                    
                    if viewModel.errorMessage == nil {
                        
                        dismiss()
                    }
                }
                
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
