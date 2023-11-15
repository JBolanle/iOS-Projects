//
//  AccountView.swift
//  Appetizers
//
//  Created by Jumoke Bolanle on 10/29/23.
//

import SwiftUI

struct AccountView: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var birthdate = Date()
    @State private var extraNapkins = false
    @State private var frequentRefills = false

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Personal Info")) {
                    TextField("First Name", text: $firstName)
                    TextField("Last Name", text: $lastName)
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.none)
                        .autocorrectionDisabled()
                    DatePicker("Birthday", selection: $birthdate, displayedComponents: [.date])

                    Button {
                        print("Saved")
                    } label: {
                        Text("Save Changes")
                    }
                }
//                .tint(.brandPrimary)

                Section(header: Text("Requests")) {
                    Toggle("Extra Napkins", isOn: $extraNapkins)
                    Toggle("Frequent Refills",isOn: $frequentRefills)
                }
//                .tint(.brandPrimary)
            }
            .navigationTitle("👤 Account")
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
}

#Preview {
    AccountView()
}
