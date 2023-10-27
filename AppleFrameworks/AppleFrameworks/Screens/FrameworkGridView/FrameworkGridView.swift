//
//  FrameworkGridView.swift
//  AppleFrameworks
//
//  Created by Jumoke Bolanle on 10/26/23.
//

import SwiftUI

struct FrameworkGridView: View {
    @StateObject var viewModel = FrameworkGridViewModel()
    @State private var isGridView = true

    var body: some View {
        VStack {
            NavigationStack {
                if isGridView == true {
                                ScrollView(.vertical) {
                                    LazyVGrid(columns: viewModel.columns) {
                                        ForEach(MockData.frameworks) { framework in
                                            NavigationLink(value: framework) {
                                                FrameworkTitleView(framework: framework)
                                            }
                                        }
                                    }
                                }
                                .navigationTitle("🍏 Frameworks")
                                .navigationDestination(for: Framework.self, destination: { framework in
                                    FrameworkDetailView(framework: framework)
                                })
                                .toolbar {
                                    Button {
                                        isGridView.toggle()
                                    } label: {
                                            Image(systemName: "list.bullet")
                                            .foregroundStyle(.white)
                                    }                                }
                } else {
                    List {
                        ForEach(MockData.frameworks) { framework in
                            NavigationLink(destination: FrameworkDetailView(framework: framework)) {
                                FrameworkListView(framework: framework)
                            }
                        }
                    }
                    .navigationTitle("🍏 Frameworks")
                    .toolbar {
                        Button {
                            isGridView.toggle()
                        } label: {
                                Image(systemName: "square.grid.2x2")
                                .foregroundStyle(.white)
                        }
                    }
                }
            }
            .accentColor(Color(.label))
        }
    }
}

#Preview {
    FrameworkGridView()
}


