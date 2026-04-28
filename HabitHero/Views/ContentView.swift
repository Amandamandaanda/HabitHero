//
//  ContentView.swift
//  HabitHero
//
//  Created by Amanda Tana on 2026-04-27.
//

import SwiftUI
import SwiftData

struct ContentView: View {

    @Query(sort: \Habit.name, order: .reverse)
    private var habits: [Habit]

    @Environment(\.modelContext)
    private var modelContext
    @State private var showAddHabit = false
    @State var viewModel = HabitViewModel()
    
    var body: some View {

       NavigationStack {
            VStack {
                Text("Antal habits: \(habits.count)")

                .padding()
                
                List {
                    ForEach(habits) {habit in
                        HabitRow(habit: habit, viewModel: viewModel, context: modelContext)

                    }
                            .onDelete { offsets in viewModel.deleteHabit(at: offsets, habits: habits, context: modelContext)
                            }
                    }
                }
                .navigationTitle("Habits")
                
                .toolbar {
                    Button {
                        showAddHabit = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                .sheet(isPresented: $showAddHabit) {
                    AddHabitView()
                }
                }
                
            
                }
                
            
        }
    


#Preview {
    ContentView()
}
