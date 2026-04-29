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
            ZStack {
                Color.generalBackground.ignoresSafeArea()
                
                VStack(spacing: 16) {
                    Text("My habits")
                        .font(.largeTitle)
                        .foregroundStyle(Color.primaryTextColor)
                        .bold()
                        .padding(.top)
                    
                    Text("\(habits.count) habits")
                        .foregroundStyle(Color.secondaryTextColor)
                    
                    WeekView(habits: habits, viewModel: viewModel)
                        .padding(.vertical, 8)
                    
                    
                    List {
                        ForEach(habits) {habit in
                            HabitRow(habit: habit, viewModel: viewModel, context: modelContext)
                                .listRowSeparator(.hidden)
                                .listRowBackground(Color.clear)
                                .padding(.vertical, 4)
                            
                        }
                        .onDelete { offsets in viewModel.deleteHabit(at: offsets, habits: habits, context: modelContext)
                        }
                    }
                    .scrollContentBackground(.hidden)
                    .listStyle(.plain)
                    .background(Color.clear)
                }
                .padding(.horizontal)
            }
            .overlay(alignment: .bottomTrailing) {
                Button {
                    showAddHabit = true
                } label: {
                    Image(systemName: "plus")
                        .font(.system(size: 30, weight: .bold))
                        .foregroundStyle(.white)
                        .frame(width: 64, height: 64)
                        .background(Color.accentColor)
                        .clipShape(Circle())
                        .shadow(color: Color.accentColor.opacity(0.6), radius: 10)
                }
                .padding()
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
