//
//  ContentView.swift
//  WeatherAppSA
//
//  Created by Jumoke Bolanle on 10/19/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.white]), 
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)

            VStack {
                HStack {
                    Image(systemName: "location.fill")
                    Text("Ypsilanti, MI")
                        .font(.title)
                }
                .padding()
                .foregroundColor(.white)

                VStack {
                    Image(systemName: "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 140, height: 100)
                }
                Spacer()



            }

        }
    }
}

#Preview {
    ContentView()
}
