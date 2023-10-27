//
//  FrameworkDetailView.swift
//  AppleFrameworks
//
//  Created by Jumoke Bolanle on 10/26/23.
//

import SwiftUI

struct FrameworkDetailView: View {
    @Environment(\.dismiss) private var dismiss
//    @State private var isSheetPresented = true

    let framework: Framework

    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .frame(width: 44, height: 44)
                        .foregroundColor(Color(.label))
                        .background(Color.secondary)
                        .imageScale(.large)
                        .cornerRadius(100)
                }
            }
            .padding()

            Spacer()
            FrameworkTitleView(framework: framework)

            Text(framework.description)
                .font(.body)
                .padding()
            Spacer()

            Button {
                //
            } label: {
                AFButton(title: "Learn More")
            }
        }
        .padding()
        .navigationTitle(framework.name)
    }
}

#Preview {
    FrameworkDetailView(framework: MockData.sampleFramework)
}


