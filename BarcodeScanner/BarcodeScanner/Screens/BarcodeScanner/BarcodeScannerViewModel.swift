//
//  BarcodeScannerViewModel.swift
//  BarcodeScanner
//
//  Created by Jumoke Bolanle on 10/29/23.
//

import SwiftUI

final class BarcodeScannerViewModel: ObservableObject {
    @Published var scannedBarcode: String = ""
    @Published var alertItem: AlertItem?

    var statusText: String {
        scannedBarcode.isEmpty ? "Not Yet Scanned" : scannedBarcode
    }

    var statusTextColor: Color {
        scannedBarcode.isEmpty ? .red : .green
    }
}
