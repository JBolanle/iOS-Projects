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

@MainActor
class DelayedUpdater: ObservableObject {
    var value = 0 {
        willSet {
            objectWillChange.send()
        }
    }

    init() {
        for i in 1...10 {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i)) {
                self.value += 1
            }
        }
    }
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

    @State private var output = ""
    func fetchReadings() async {
        let fetchTask = Task { () -> String in
            let url = URL(string: "https://hws.dev/readings.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let readings = try JSONDecoder().decode([Double].self, from: data)
            return "Found \(readings.count) readings."
        }

        let result = await fetchTask.result

        switch result {
        case .success(let str):
            output = str
        case .failure(let error):
            output = "Error: \(error.localizedDescription)"
        }

    }


    @ObservedObject var updater = DelayedUpdater()

    var body: some View {
        Text(output)
            .task {
                await fetchReadings()
            }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
