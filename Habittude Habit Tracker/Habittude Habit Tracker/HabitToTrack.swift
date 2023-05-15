//
//  HabitToTrack.swift
//  Habittude Habit Tracker
//
//  Created by Jumoke Bolanle on 5/13/23.
//

import Foundation

// What properties does a habit have?
// Name/Title, Description, and unique id
// Since we're tracking it, it'll need some sort of counter for how many days/times you've done that habit
// start date? maybe end date?
// streak counter?

struct HabitToTrack: Codable, Identifiable {
    // Creating the properties that belong to a habit
    var id = UUID()
    let habitName: String
    let description: String
    var completionCount: Int
    
}


class Habit: ObservableObject {
    @Published var habits = [HabitToTrack]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(habits) {
                UserDefaults.standard.set(encoded, forKey: "Habits")
            }
        }
    }
    
    init() {
        if let savedHabits = UserDefaults.standard.data(forKey: "Habits") {
            if let decodedHabits = try? JSONDecoder().decode([HabitToTrack].self, from: savedHabits) {
                habits = decodedHabits
                return
            }
        }
        
        habits = []
    }
    
}
