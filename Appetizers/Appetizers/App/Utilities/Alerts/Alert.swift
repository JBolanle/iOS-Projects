//
//  Alert.swift
//  Appetizers
//
//  Created by Jumoke Bolanle on 10/31/23.
//

import SwiftUI

struct AlertItem: Identifiable {
    var id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    // MARK: - Network Alerts
    static let invalidURL = AlertItem(title: Text("Server Error"), message: Text("There was an issue connecting to the server. If this persists, please contact support"), dismissButton: .default(Text("Ok")))

    static let invalidResponse = AlertItem(title: Text("Server Error"), message: Text("Invalid response from the server. Please try again later or contact support."), dismissButton: .default(Text("Ok")))

    static let invalidData = AlertItem(title: Text("Server Error"), message: Text("The data received from the server is invalid. Please contact support."), dismissButton: .default(Text("Ok")))

    static let unableToComplete = AlertItem(title: Text("Server Error"), message: Text("Unable to complete your request at this time. Please check your internet connection."), dismissButton: .default(Text("Ok")))

    // MARK: - Account Alerts
    static let invalidForm = AlertItem(title: Text("Invalid Form"), message: Text("Please make sure all fields in the form are filled out."), dismissButton: .default(Text("Ok")))

    static let invalidEmail = AlertItem(title: Text("Invalid Email"), message: Text("Please type in a valid email."), dismissButton: .default(Text("Ok")))

    static let userSaveSuccess = AlertItem(title: Text("Profile Saved"), message: Text("Your profile information was successfully saved."), dismissButton: .default(Text("Done")))

    static let invalidUserData = AlertItem(title: Text("Profile Error"), message: Text("There was an error retrieving your profile."), dismissButton: .default(Text("Done")))
}
