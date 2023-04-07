//
//  ContentView.swift
//  Animations
//
//  Created by Jumoke Bolanle on 4/5/23.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 0.0
    @State private var enabled = true
    
    var body: some View {
        Button("Tap Me") {
            enabled.toggle()
        }
        .frame(width: 200, height: 200)
        .background(enabled ? .blue : .red)
        .foregroundColor(.white)
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
