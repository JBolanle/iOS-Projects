//
//  Location.swift
//  BucketList
//
//  Created by Jumoke Bolanle on 8/8/23.
//

import Foundation
import MapKit

struct Location: Identifiable, Codable, Equatable {
    var id: UUID
    var name: String
    var description: String
    let latitude: Double
    let longitude: Double

    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }

    static func ==(lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }

    static let example = Location(id: UUID(), name: "University of Michigan, Ann Arbor", description: "Go Blue!", latitude: 42.283, longitude: -83.735)
}
