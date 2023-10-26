//
//  WeatherDayViewModel.swift
//  WeatherAppSA
//
//  Created by Jumoke Bolanle on 10/26/23.
//

import Foundation

struct WeatherDayViewModel: Codable, Hashable {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int

}
