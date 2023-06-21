//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Jumoke Bolanle on 6/20/23.
//

import SwiftUI

//MARK: CUSTOM STRUCTS
struct Student: Hashable {
    let name: String
}

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    
    let students = [Student(name: "Rock Lee"), Student(name: "Neji Hyuga")]
    
    //MARK: CONTENTVIEW
    var body: some View {
        List(students, id: \.self) { student in
            Text(student.name)
        }
    }
}

//MARK: PREVIEWS
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
