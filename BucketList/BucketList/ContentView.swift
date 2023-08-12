//
//  ContentView.swift
//  BucketList
//
//  Created by Jumoke Bolanle on 7/23/23.
//

import LocalAuthentication
import SwiftUI

struct ContentView: View {
    @State private var isUnlocked = false

    func authenticate() {
        let context = LAContext()
        var error: NSError?

        //check if biometric auth is possible
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            // if possible, go ahead and use it
            let reason = "We need to unluck your data."

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                // auth has no completed
                if success {
                    isUnlocked = true
                } else {
                    // there's a problem
                }
            }
        } else {
            // no biometrics
        }
    }

    var body: some View {
        VStack {
            if isUnlocked {
                Text("Unlocked")
            } else {
                Text("Locked")
            }
        }
        .onAppear(perform: authenticate)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
