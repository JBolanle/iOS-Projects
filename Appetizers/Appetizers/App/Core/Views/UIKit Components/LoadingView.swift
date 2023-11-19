//
//  LoadingView.swift
//  Appetizers
//
//  Created by Jumoke Bolanle on 11/3/23.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            
            ActivityIndicatory()
        }
    }
}


struct ActivityIndicatory: UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
        let activityIndicatorView = UIActivityIndicatorView(style: .large)
        activityIndicatorView.color = UIColor.brandPrimary
        return activityIndicatorView
    }

    func updateUIView(_ uiView: UIViewType, context: Context) { }
}
