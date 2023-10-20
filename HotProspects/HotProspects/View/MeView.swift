//
//  MeView.swift
//  HotProspects
//
//  Created by Jumoke Bolanle on 9/26/23.
//

//import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct MeView: View {
    @State private var name = "Anonymous"
    @State private var emailAddress = "anon@anon.com"
    @State private var qrCode = UIImage()

    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()

    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                    .textContentType(.name)
                    .font(.title)

                Image(uiImage: qrCode)
                    .interpolation(.none)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .contextMenu {
                        Button {
                            let image = generateQRCode(from: "\(name)\n\(emailAddress)")
                            let imageSaver = ImageSaver()
                            imageSaver.writeToPhotoAlbum(image: image)
                        } label: {
                            Label("Save to photos", systemImage: "square.and.arrow.down")
                        }
                    }

                TextField("Email Address", text: $emailAddress)
                    .textContentType(.emailAddress)
                    .font(.title)
            }
            .navigationTitle("Your Code")
            .onAppear(perform: updateCode)
            .onChange(of: name) {_ in updateCode() }
            .onChange(of: emailAddress) {_ in updateCode() }
        }
    }

    func generateQRCode(from string: String) -> UIImage {
        filter.message = Data(string.utf8)

        if let outputImage = filter.outputImage {
            if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
                return UIImage(cgImage: cgimg)
            }
        }

        return UIImage(systemName: "xmark.cirlce") ?? UIImage()
    }

    func updateCode() {
        qrCode = generateQRCode(from: "\(name)\n\(emailAddress)")
    }
}

struct MeView_Previews: PreviewProvider {
    static var previews: some View {
        MeView()
    }
}
