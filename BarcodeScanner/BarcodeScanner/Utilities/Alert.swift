//
//  Alert.swift
//  BarcodeScanner
//
//  Created by Jumoke Bolanle on 10/29/23.
//

import SwiftUI

struct AlertItem: Identifiable {
    var id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let invalidDeviceInput = AlertItem(title: Text("Invalid Device Input"), message: Text("Something is wrong with the camera. We are unable to capture the input."), dismissButton: .default(Text("Ok")))

    static let invalidScanValue = AlertItem(title: Text("Invalid Scan Value"), message: Text("The value scanned is not valid. This app scans EAN-8 and EAN-13."), dismissButton: .default(Text("Ok")))
}
