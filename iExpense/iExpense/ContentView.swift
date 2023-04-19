//
//  ContentView.swift
//  iExpense
//
//  Created by Jumoke Bolanle on 4/13/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var user = User()
    @State private var showingSheet = false
    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")

    
    var body: some View {
//        Button("Show Sheet") {
//            showingSheet.toggle()
//
//        }
//        .sheet(isPresented: $showingSheet) {
//            secondView()
//        }
        
        Button("Tap count: \(tapCount)") {
            tapCount += 1
            UserDefaults.standard.set(self.tapCount, forKey: "Tap")
        }
        
    }
}

struct secondView: View {
    @Environment (\.dismiss) var dismiss
    
    @State private var numbers = [Int]()
    @State private var currentNumbers = 1
    
//    let name: String
    
    var body: some View {
//        Text("Hello, \(name)!")
//        Button("Dismiss") {
//            dismiss()
//        }
        
        NavigationView {
            VStack {
                List {
                    ForEach(numbers, id: \.self) {
                        Text("Row \($0)")
                    }
                    .onDelete(perform: removeRows)
                }
                
                Button("Add Number") {
                    numbers.append(currentNumbers)
                    currentNumbers += 1
                }
            }
            .toolbar {
                EditButton()
            }
        }
    }
    
    func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

class User: ObservableObject {
    @Published var firstName = "Jumoke"
    @Published var lastName = "Bolanle"
}
