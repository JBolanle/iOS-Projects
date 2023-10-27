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
            NavigationView {
                if isGridView == true {
                                ScrollView(.vertical) {
                                    LazyVGrid(columns: viewModel.columns) {
                                        ForEach(MockData.frameworks) { framework in
                                            FrameworkTitleView(framework: framework)
                                                .onTapGesture {
                                                    viewModel.selectedFramework = framework
                                                }
                                        }
                                    }
                                }
                                .sheet(isPresented: $viewModel.isShowingDetailView) {
                                    FrameworkDetailView(framework: viewModel.selectedFramework ?? MockData.sampleFramework)
                                }
                                .navigationTitle("🍏 Frameworks")
                                .toolbar {
                                    Button {
                                        isGridView.toggle()
                                    } label: {
                                            Image(systemName: "list.bullet")
                                            .foregroundStyle(.white)
                                    }
                                }
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
        }
    }
}

#Preview {
    FrameworkGridView()
}


