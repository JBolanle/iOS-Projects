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
                VStack(spacing: 5) {
                    Text("Calories")
                        .bold()
                        .font(.caption)
                    Text(String(appetizer.calories) + " kcal")
                        .foregroundStyle(Color(.secondaryLabel))
                        .fontWeight(.semibold)
                        .italic()
                }
                VStack(spacing: 5) {
                    Text("Carbs")
                        .bold()
                        .font(.caption)
                    Text(String(appetizer.calories) + " g")
                        .foregroundStyle(Color(.secondaryLabel))
                        .fontWeight(.semibold)
                        .italic()
                }
                VStack(spacing: 5) {
                    Text("Protein")
                        .bold()
                        .font(.caption)
                    Text(String(appetizer.protein) + " g")
                        .foregroundStyle(Color(.secondaryLabel))
                        .fontWeight(.semibold)
                        .italic()
                }
            }

            Spacer()

            Button {
                print("Tapped")
            } label: {
                Text("$\(appetizer.price, specifier: "%.2f") - Add to Order")
                    .font(.title3)
                    .fontWeight(.semibold)
            }
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
                ZStack {
                    Circle()
                        .frame(width: 30, height: 30, alignment: .center)
                        .foregroundStyle(Color(.white))
                        .opacity(0.6)

                    Image(systemName: "xmark")
                        .imageScale(.small)
                        .frame(width: 40, height: 44)
                        .foregroundStyle(Color(.black))
                }

            }, alignment: .topTrailing)
    }
}

#Preview {
    AppetizerDetailView(appetizer: MockData.sampleAppetizer, isShowingDetail: .constant(true))
}
