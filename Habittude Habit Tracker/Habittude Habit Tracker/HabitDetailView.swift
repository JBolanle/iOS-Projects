//
//  HabitDetailView.swift
//  Habittude Habit Tracker
//
//  Created by Jumoke Bolanle on 5/15/23.
//

import SwiftUI

struct HabitDetailView: View {
    let habit: Habit
    
    init(habit: Habit) {
        self.habit = habit
    }
    
    var body: some View {
        VStack {
            Text(habit)
        }
    }
}

struct HabitDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HabitDetailView()
    }
}
