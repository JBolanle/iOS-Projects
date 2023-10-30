//
//  ContentView.swift
//  BarcodeScanner
//
//  Created by Jumoke Bolanle on 10/27/23.
//

import SwiftUI

struct BarcodeScannerView: View {
    @StateObject var viewModel = BarcodeScannerViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                ScannerView(scannedBarcode: $viewModel.scannedBarcode, alertItem: $viewModel.alertItem)
                    .frame(maxWidth: .infinity, maxHeight: 300)

                Spacer().frame(height: 60)

                Label("Scanned Barcode: ", systemImage: "barcode.viewfinder")
                    .font(.title)


                Text(viewModel.statusText)
                    .bold()
                    .font(.largeTitle)
                    .foregroundStyle(viewModel.statusTextColor)
                    .fontDesign(.rounded)
                    .padding()


            }
            .navigationTitle("Barcode Scanner")
            .alert(item: $viewModel.alertItem) { alertItem in
                Alert(title: Text(alertItem.title), message: Text(alertItem.message), dismissButton: alertItem.dismissButton)
            }
        }
    }
}

#Preview {
    BarcodeScannerView()
}
