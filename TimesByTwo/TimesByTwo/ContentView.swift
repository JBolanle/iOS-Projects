//
//  ContentView.swift
//  TimesByTwo
//
//  Created by Jumoke Bolanle on 4/15/23.
//

import SwiftUI

struct ContentView: View {
    @State private var gameIsActive = true
    @State private var multiplyNumBy = 2
    @State private var howManyQuestions = 0
    
    var body: some View {
        NavigationView{
            if gameIsActive {
                Form {
                    Section{
                        Text("Which multiplication table would you like to practice?")
                        Stepper(value: $multiplyNumBy, in: 2...12) {
                            Text("\(multiplyNumBy)")
                        }
                    }
                    Section{
                        Text("How many questions do you want?")
                        Stepper(value: $howManyQuestions, in: 5...20, step: 5) {
                            Text("\(howManyQuestions)")
                        }
                    }
                }
                .navigationTitle("XOR")
            } else {
                Text("Game is not active")
                    .navigationTitle("XOR")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
