//
//  ScannerView.swift
//  BarcodeScanner
//
//  Created by Jumoke Bolanle on 10/27/23.
//

import SwiftUI

struct ScannerView: UIViewControllerRepresentable {
    @Binding var scannedBarcode: String
    @Binding var alertItem: AlertItem?

    func makeCoordinator() -> Coordinator {
        Coordinator(scannerView: self)
    }
    
    func makeUIViewController(context: Context) -> ScannerVC {
        ScannerVC(scannerDelegate: context.coordinator)
    }
    
    func updateUIViewController(_ uiViewController: ScannerVC, context: Context) { }

    final class Coordinator: NSObject, ScannerVCDelegate {
        private let scannerView: ScannerView

        init(scannerView: ScannerView) {
            self.scannerView = scannerView
        }

        func didFind(barcode: String) {
            scannerView.scannedBarcode = barcode
        }
        
        func didSurface(error: CameraError) {
            switch error {
            case .invalidDeviceInput:
                scannerView.alertItem = AlertContext.invalidDeviceInput
            case .invalidScanValue:
                scannerView.alertItem = AlertContext.invalidScanValue
            }
        }
    }
}

#Preview {
    ScannerView(scannedBarcode: .constant("123456"), alertItem: .constant(AlertContext.invalidScanValue))
}
