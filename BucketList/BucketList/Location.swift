//
//  Location.swift
//  BucketList
//
//  Created by Jumoke Bolanle on 8/8/23.
//

import Foundation
import MapKit

struct Location: Identifiable, Codable, Equatable {
    let id: UUID
    let name: String
    let description: String
    let latitude: Double
    let longitude: Double
}
