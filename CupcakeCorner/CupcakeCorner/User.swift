//
//  User.swift
//  CupcakeCorner
//
//  Created by Jumoke Bolanle on 5/17/23.
//

import Foundation

class User: Codable, ObservableObject {
    
    @Published var name = "My Name Here"
    
    enum CodingKeys: CodingKey {
        case name
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
    }
    
}
