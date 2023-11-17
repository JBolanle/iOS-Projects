//
//  XDismissButton.swift
//  Appetizers
//
//  Created by Jumoke Bolanle on 11/14/23.
//

import SwiftUI

struct XDismissButton: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 30, height: 30, alignment: .center)
                .foregroundStyle(Color(.white))
                .opacity(0.6)

            Image(systemName: "xmark")
                .imageScale(.small)
                .frame(width: 40, height: 44)
                .foregroundStyle(Color(.black))
        }
    }
}

#Preview {
    XDismissButton()
}
