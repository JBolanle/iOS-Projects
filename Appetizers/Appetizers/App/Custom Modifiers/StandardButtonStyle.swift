//
//  StandardButton.swift
//  Appetizers
//
//  Created by Jumoke Bolanle on 11/18/23.
//

import SwiftUI

struct StandardButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title3)
            .fontWeight(.semibold)
            .buttonStyle(.bordered)
            .controlSize(.large)
            .buttonBorderShape(.roundedRectangle(radius: 10))
            .tint(.brandPrimary)
    }
}

extension Button {
    func standardButtonStyle() -> some View {
        self.modifier(StandardButtonStyle())
    }
}
