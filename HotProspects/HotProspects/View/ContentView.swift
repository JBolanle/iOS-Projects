//
//  ContentView.swift
//  HotProspects
//
//  Created by Jumoke Bolanle on 9/10/23.
//

import SwiftUI


@MainActor
class User: ObservableObject {
    @Published var name = "Taylor Swift"
}

struct EditView: View {
    @EnvironmentObject var user: User

    var body: some View {
        TextField("Name", text: $user.name)
    }
}

struct DisplayView: View {
    @EnvironmentObject var user: User

    var body: some View {
        Text(user.name)
    }
}

struct ContentView: View {
    @StateObject var user = User()
    @State private var selectedTab = "One"

    var body: some View {
        TabView(selection: $selectedTab) {
            DisplayView()
                .onTapGesture {
                    selectedTab = "Two"
                }
                .tabItem {
                    Label("One", systemImage: "star")
                }
                .tag("One")

            EditView()
                .tabItem {
                    Label("Two", systemImage: "circle")
                }
                .tag("Two")
        }
        .environmentObject(user)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
