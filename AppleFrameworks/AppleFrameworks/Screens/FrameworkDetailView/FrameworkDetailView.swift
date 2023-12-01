//
//  FrameworkDetailView.swift
//  AppleFrameworks
//
//  Created by Jumoke Bolanle on 10/26/23.
//

import SwiftUI

struct FrameworkDetailView: View {
    @State private var isShowingSafariView = false

    let framework: Framework

    var body: some View {
        VStack {
//            XDismissButton()
            Spacer()
            
            FrameworkTitleView(framework: framework)

            ScrollView {
                Text(framework.description)
                    .font(.body)
                .padding()
            }
            Spacer()

            Link(destination: URL(string: framework.urlString)!, label: {
                Button {
                    //
                } label: {
                    Label("Learn More", systemImage: "book.fill")
                }
                .buttonStyle(.bordered)
                .controlSize(.large)
                .buttonBorderShape(.roundedRectangle(radius: 20))
                .tint(.green)
            })

            Button {
                isShowingSafariView = true
            } label: {
//                AFButton(title: "Learn More")
                Label("Learn More", systemImage: "book.fill")
            }
            .buttonStyle(.bordered)
            .controlSize(.large)
            .buttonBorderShape(.roundedRectangle(radius: 20))
            .tint(.green)

        }
        .padding()
        .fullScreenCover(isPresented: $isShowingSafariView) {
            SafariView(url: URL(string: framework.urlString) ?? URL(string: "http://developer.apple.com")!)
        }
    }
}

#Preview {
    FrameworkDetailView(framework: MockData.sampleFramework)
}



