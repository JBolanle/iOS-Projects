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
    @State private var howManyQuestions = 5
    @State private var userAnswer = ""
    
    var body: some View {
        NavigationView{
            if gameIsActive == false {
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
                    Button("Start Practice") {
                        gameIsActive = true
                    }
                }
                .navigationTitle("Settings")
            } else {
                VStack{
                    Form{
                        Text("What is \(multiplyNumBy) x 12")
                        TextField("Enter your answer: ", text: $userAnswer)
                            .keyboardType(.decimalPad)
                        Button("Check Answer") {}
                    }
                    Button("End Practice") {
                        gameIsActive = false
                    }
                }
                    .navigationTitle("\(multiplyNumBy) Times Table Practice")
            }
        }
    }
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
