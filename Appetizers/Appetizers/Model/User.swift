//
//  User.swift
//  Appetizers
//
//  Created by Jumoke Bolanle on 11/15/23.
//

import Foundation

struct User: Codable {
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthdate = Date()
    var extraNapkins = false
    var frequentRefills = false
}
