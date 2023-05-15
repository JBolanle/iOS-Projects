//
//  AddNewHabit.swift
//  Habittude Habit Tracker
//
//  Created by Jumoke Bolanle on 5/15/23.
//

import SwiftUI

struct AddNewHabit: View {
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var habit = Habit()
    
   @State private var name = ""
   @State private var description = ""
    
    var body: some View {
        NavigationView {
            Form{
                TextField("Habit Name", text: $name)
                
                TextField("Describe your goals", text: $description)
            }
            .navigationTitle("New Habit")
                .toolbar {
                    Button("Add Habit") {
                        let newHabit = HabitToTrack(habitName: name, description: description, completionCount: 0)
                        habit.habits.append(newHabit)
                        dismiss()
                    }
                }
        }
        
    }
}

struct AddNewHabit_Previews: PreviewProvider {
    static var previews: some View {
        AddNewHabit()
    }
}
