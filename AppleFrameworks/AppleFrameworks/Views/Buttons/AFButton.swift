//
//  AFButton.swift
//  AppleFrameworks
//
//  Created by Jumoke Bolanle on 10/26/23.
//

import SwiftUI

struct AFButton: View {
    let title: String

    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .font(.title2)
            .fontWeight(.bold)
            .background(Color(.red))
            .foregroundColor(.white)
            .cornerRadius(80)
    }
}

#Preview {
    AFButton(title: "Button")
}
