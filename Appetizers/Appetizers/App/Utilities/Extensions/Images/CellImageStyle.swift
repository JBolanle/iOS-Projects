//
//  CellImageStyle.swift
//  Appetizers
//
//  Created by Jumoke Bolanle on 11/19/23.
//

import SwiftUI

extension Image {
    func cellImageStyle() -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 120, height: 90)
    }
}
