//
//  WeatherDayView.swift
//  WeatherAppSA
//
//  Created by Jumoke Bolanle on 10/26/23.
//

import SwiftUI

struct WeatherDayView: View {
//    let model: WeatherDayViewModel

    var dayOfWeek: String
    var imageName: String
    var temperature: Int


    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 20, weight: .medium, design: .rounded))
                .foregroundColor(.white)
                .padding()
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

#Preview {
    WeatherDayView(dayOfWeek: "MON", imageName: "sun.max.fill", temperature: 82)
}
