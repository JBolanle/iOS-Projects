//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by Jumoke Bolanle on 11/13/23.
//

import SwiftUI

struct AppetizerDetailView: View {
    let appetizer: Appetizer
    @Binding var isShowingDetail: Bool

    var body: some View {
        VStack {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 320, height: 225)

            Text(appetizer.name)
                .font(.title)
                .fontWeight(.semibold)
                .fontDesign(.rounded)

            Text(appetizer.description)
                .multilineTextAlignment(.center)
                .font(.body)
                .padding()

            Spacer()

            HStack(alignment: .center, spacing: 20) {
                NutritionInfo(title: "Calories", value: appetizer.calories)
                NutritionInfo(title: "Carbs", value: appetizer.carbs)
                NutritionInfo(title: "Protein", value: appetizer.protein)
            }

            Spacer()

            Button {
                print("Tapped")
            } label: {
                Text("$\(appetizer.price, specifier: "%.2f") - Add to Order")
            }
            .font(.title3)
            .fontWeight(.semibold)
            .buttonStyle(.bordered)
            .controlSize(.large)
            .buttonBorderShape(.roundedRectangle(radius: 10))
            .tint(.brandPrimary)
            .padding(.bottom)
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 20.0))
        .shadow(radius: 40)
        .overlay(
            Button {
                isShowingDetail = false
            } label: {
                XDismissButton()

            }, alignment: .topTrailing)
    }
}

#Preview {
    AppetizerDetailView(appetizer: MockData.sampleAppetizer, isShowingDetail: .constant(true))
}

struct NutritionInfo: View {
    let title: String
    let value: Int

    var body: some View {
        VStack(spacing: 5) {
            Text(title)
                .bold()
                .font(.caption)
            Text(title == "Calories" ? "\(value) kcal" : "\(value) g")
                .foregroundStyle(Color(.secondaryLabel))
                .fontWeight(.semibold)
                .italic()
        }
    }
}
