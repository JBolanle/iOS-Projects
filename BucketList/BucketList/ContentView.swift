//
//  ContentView.swift
//  BucketList
//
//  Created by Jumoke Bolanle on 7/23/23.
//

import SwiftUI

struct ContentView: View {
    var loadingState = LoadingState.failed

    var body: some View {
        if loadingState == .loading {
            LoadingView()
        } else if loadingState == .success {
            SuccessView()
        } else if loadingState == .failed {
            FailedView()
        }
    }

    enum LoadingState {
        case loading, success, failed
    }

    struct LoadingView: View {
        var body: some View {
            Text("Loading...")
        }
    }

    struct SuccessView: View {
        var body: some View {
            Text("Success!")
        }
    }

    struct FailedView: View {
        var body: some View {
            Text("Failed.")
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
