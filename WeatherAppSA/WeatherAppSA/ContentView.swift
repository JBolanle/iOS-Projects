//
//  ContentView.swift
//  WeatherAppSA
//
//  Created by Jumoke Bolanle on 10/19/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false

    var body: some View {
        ZStack {

            BackgroundView(isNight: $isNight)

            VStack {
                CityTextView(cityName: "Chicago, IL")

                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 76)

                HStack {
                    WeatherDayView(dayOfWeek: "MON", imageName: "cloud.sun.fill", temperature: 76)
                    WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.rain.fill", temperature: 76)
                    WeatherDayView(dayOfWeek: "WED", imageName: "sun.rain.fill", temperature: 76)
                    WeatherDayView(dayOfWeek: "THU", imageName: "cloud.fill", temperature: 60)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "cloud.rain.fill", temperature: 76)
                }
                Spacer()

                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time", textColor: isNight ? .white : .white, backgroundColor: isNight ? .gray : .mint)
                }

                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct BackgroundView: View {
    @Binding var isNight: Bool

    var body: some View {
//        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : .lightBlue]),
//                       startPoint: .topLeading,
//                       endPoint: .bottomTrailing)
//        .edgesIgnoringSafeArea(.all)
        ContainerRelativeShape()
            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
            .ignoresSafeArea()
    }
}

struct CityTextView: View {
    var cityName: String

    var body: some View {
        HStack {
            Image(systemName: "location.fill")
            Text(cityName)
                .font(.system(size: 32, weight: .medium, design: .default))
                .padding()
        }
        .foregroundColor(.white)
    }
}

struct MainWeatherStatusView: View {
    var imageName: String
    var temperature: Int

    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)

            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}

struct WeatherDayView: View {
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
