//
//  ContentView.swift
//  iExpense
//
//  Created by Jumoke Bolanle on 4/13/23.
//

import SwiftUI

struct ContentView: View {
    @State private var user = User()
    
    
    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName).")
            
            TextField("First name", text: $user.firstName)
            TextField("Last name", text: $user.lastName)
            
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

class User {
    @Published var firstName = "Jumoke"
    @Published var lastName = "Bolanle"
}
