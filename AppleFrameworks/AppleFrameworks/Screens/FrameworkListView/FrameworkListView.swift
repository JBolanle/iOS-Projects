//
//  FrameworkListView.swift
//  AppleFrameworks
//
//  Created by Jumoke Bolanle on 10/26/23.
//

import SwiftUI

struct FrameworkListView: View {
    let framework: Framework

    var body: some View {
            FrameworkListItem(imageName: framework.imageName, name: framework.name)
    }
}

#Preview {
    FrameworkListView(framework: MockData.sampleFramework)
}

struct FrameworkListItem: View {
    let imageName: String
    let name: String

    var body: some View {
        HStack {
            Image(imageName)
                .resizable()
                .frame(width: 70, height: 70)
            Text(name)
                .font(.title2)
                .fontWeight(.semibold)
                .scaledToFit()
                .minimumScaleFactor(0.7)
        }
//        .padding()
    }
}
