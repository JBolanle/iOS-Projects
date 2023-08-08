//
//  Location.swift
//  BucketList
//
//  Created by Jumoke Bolanle on 8/8/23.
//

import Foundation
import MapKit

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}
