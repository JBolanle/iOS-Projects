//
//  ContentView.swift
//  Habittude Habit Tracker
//
//  Created by Jumoke Bolanle on 5/13/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var habit = Habit()
    
    
    var body: some View {
        NavigationView{
            List{
                Section {
                    ForEach(habit.habits) { habit in
                        HStack {
                            Text(habit.habitName)
                        }
                        
                    }
                }
            }
            .navigationTitle("Habittude")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
