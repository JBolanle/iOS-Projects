//
//  ContentView.swift
//  Drawing
//
//  Created by Jumoke Bolanle on 5/6/23.
//

import SwiftUI

struct ContentView: View {
    @State private var colorCycle = 0.0
    
    
    var body: some View {
        VStack {
            ColorCyclingCircle(amount: colorCycle)
                .frame(width: 300, height: 300)
            
            Slider(value: $colorCycle)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}