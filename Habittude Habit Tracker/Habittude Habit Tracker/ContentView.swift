//
//  ContentView.swift
//  Habittude Habit Tracker
//
//  Created by Jumoke Bolanle on 5/13/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var habit = Habit()
    
    @State private var showingAddHabitView = false
    
    
    var body: some View {
        NavigationView{
            List{
                Section {
                    ForEach(habit.habits) { habit in
                        NavigationLink {
                            Text(habit.habitName)
//                            Spacer()
                            Text(habit.description)
                        } label: {
                            Text(habit.habitName)
                        }
                        
                    }
                    .onDelete(perform: deleteHabit)
                }
            }
            .navigationTitle("Habittude")
            .toolbar {
                Button {
                    showingAddHabitView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddHabitView) {
                AddNewHabit(habit: habit)
            }
        }
    }
    
    
    func deleteHabit(at offset: IndexSet) {
        habit.habits.remove(atOffsets: offset)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
