//
//  XDismissButton.swift
//  AppleFrameworks
//
//  Created by Jumoke Bolanle on 10/26/23.
//

import SwiftUI

struct XDismissButton: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
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
    }
}


#Preview {
    XDismissButton()
}
