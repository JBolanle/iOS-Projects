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

            Button {
                isShowingSafariView = true
            } label: {
                AFButton(title: "Learn More")
            }
        }
        .padding()
        .fullScreenCover(isPresented: $isShowingSafariView) {
            SafariView(url: URL(string: framework.urlString) ?? URL(string: "http://www.apple.com")!)
        }
    }
}

#Preview {
    FrameworkDetailView(framework: MockData.sampleFramework)
}



