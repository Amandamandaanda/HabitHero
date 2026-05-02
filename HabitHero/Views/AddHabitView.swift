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
            ZStack {
                Color.generalBackground.ignoresSafeArea()
                
                VStack(spacing: 16) {
                    VStack(alignment: .leading, spacing:  8) {
                        Text("New Habit")
                            .font(.headline)
                            .foregroundStyle(Color.primaryTextColor)
                        
                        TextField("New habit...", text: $viewModel.habitName)
                            .textFieldStyle(.plain)
                            .foregroundStyle(Color.primaryTextColor)
                    }
                    .padding()
                    .background(Color.listCardBackground)
                    .clipShape(RoundedRectangle(cornerRadius: 14))
                    .shadow(color: .black.opacity(0.2), radius: 4, y: 2)
                    .padding(.horizontal)
                    
                    if let error = viewModel.errorMessage, !error.isEmpty {
                        Text(error)
                            .foregroundStyle(Color.accentColor)
                            .font(.caption)
                            .padding(.horizontal)
                    }
                    
                    Button(role: .cancel) {
                        viewModel.errorMessage = nil
                        
                        viewModel.saveHabit(context: modelContext)
                        
                        guard viewModel.errorMessage == nil else { return}
                        
                        dismiss()
                    } label: {
                        Text("Save")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.accentColor)
                            .foregroundStyle(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 14))
                            .shadow(color: Color.accentColor.opacity(0.4), radius: 6)
                        
                    }
                    .padding(.horizontal)
                    Spacer()
                }
                .navigationTitle("New habit")
                
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button ("Cancel", role: .cancel) {
                            dismiss()
                            
                        }
                    }
                }
            }
            
        }
    }
}
