//
//  ContentView.swift
//  BarcodeScanner
//
//  Created by Jumoke Bolanle on 10/27/23.
//

import SwiftUI

struct AlertItem: Identifiable {
    var id = UUID()
    let title: String
    let message: String
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let invalidDeviceInput = AlertItem(title: "Invalid Device Input", message: "Something is wrong with the camera. We are unable to capture the input.", dismissButton: .default(Text("Ok")))
    
    static let invalidScanValue = AlertItem(title: "Invalid Scan Value", message: "The value scanned is not valid. This app scans EAN-8 and EAN-13.", dismissButton: .default(Text("Ok")))
}

struct BarcodeScannerView: View {
    @State private var scannedBarcode: String = ""
    @State private var alertItem: AlertItem?

    var body: some View {
        NavigationStack {
            VStack {
                ScannerView(scannedBarcode: $scannedBarcode, alertItem: $alertItem)
                    .frame(maxWidth: .infinity, maxHeight: 300)

                Spacer().frame(height: 60)

                Label("Scanned Barcode: ", systemImage: "barcode.viewfinder")
                    .font(.title)


                Text(scannedBarcode.isEmpty ? "Not Yet Scanned" : scannedBarcode)
                    .bold()
                    .font(.largeTitle)
                    .foregroundStyle(scannedBarcode.isEmpty ? .red : .green)
                    .fontDesign(.rounded)
                    .padding()


            }
            .navigationTitle("Barcode Scanner")
            .alert(item: $alertItem) { alertItem in
                Alert(title: Text(alertItem.title), message: Text(alertItem.message), dismissButton: alertItem.dismissButton)
            }
        }
    }
}

#Preview {
    BarcodeScannerView()
}
