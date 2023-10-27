//
//  ContentView.swift
//  BarcodeScanner
//
//  Created by Jumoke Bolanle on 10/27/23.
//

import SwiftUI

struct BarcodeScannerView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: 300)

                Spacer().frame(height: 60)

                Label("Scanned Barcode: ", systemImage: "barcode.viewfinder")
                    .font(.title)


                Text("Not Yet Scanned")
                    .bold()
                    .font(.largeTitle)
                    .foregroundStyle(Color.green)
                    .fontDesign(.rounded)
                    .padding()
            }
            .navigationTitle("Barcode Scanner")
        }
    }
}

#Preview {
    BarcodeScannerView()
}
