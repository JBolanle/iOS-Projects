//
//  ContentView.swift
//  Moonshot
//
//  Created by Jumoke Bolanle on 4/30/23.
//

import SwiftUI

struct ContentView: View {

    
    var body: some View {
        NavigationView {
            MissionTitleView()
            .navigationTitle("Moonshot")
            .background(.darkBackground)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
