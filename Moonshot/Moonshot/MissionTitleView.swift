//
//  MissionTitleView.swift
//  Moonshot
//
//  Created by Jumoke Bolanle on 5/5/23.
//

import SwiftUI

let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
let missions: [Mission] = Bundle.main.decode("missions.json")

struct MissionTitleView: View {
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(missions) { mission in
                    NavigationLink {
                        MissionView(mission: mission, astronauts: astronauts)
                    } label: {
                        VStack {
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .padding()
                                
                            
                            VStack {
                                Text(mission.displayName)
                                    .font(.headline)
                                    .foregroundColor(.white)
                                Text(mission.formattedLaunchDate)
                                    .font(.caption)
                                    .foregroundColor(.white.opacity(0.5))
                            }
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(.lightBackground)
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.lightBackground)
                        )
                    }
                }
                .padding([.horizontal, .bottom])
            }
            .preferredColorScheme(.dark)
        }
    }
}

struct MissionTitleView_Previews: PreviewProvider {
    static var previews: some View {
        MissionTitleView()
            .background(.darkBackground)
    }
}
