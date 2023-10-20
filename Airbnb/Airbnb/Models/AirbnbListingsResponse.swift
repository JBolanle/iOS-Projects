//
//  AirbnbListingsResponse.swift
//  Airbnb
//
//  Created by Jumoke Bolanle on 10/11/23.
//

import Foundation

struct AirbnbListingsResponse: Codable {
    let total_count: Int
    let results: [AirbnbListing]
}
