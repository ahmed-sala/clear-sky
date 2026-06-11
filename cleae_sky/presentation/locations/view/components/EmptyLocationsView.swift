//
//  EmptyLocationsView.swift
//  cleae_sky
//
//  Created by Ahmed Salah on 11/06/2026.
//

import SwiftUI

struct EmptyLocationsView: View {

    var body: some View {
        VStack(spacing: 20) {

            Image(systemName: "location.slash")
                .font(.system(size: 60))
                .foregroundStyle(.white.opacity(0.8))

            Text("No Saved Locations")
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundStyle(.white)

            Text("Search for a city and save it to quickly access its weather later.")
                .font(.subheadline)
                .foregroundStyle(.white.opacity(0.7))
                .multilineTextAlignment(.center)
        }
        .padding(30)
        .frame(maxWidth: .infinity)
        .glassCardStyle()
        .padding(.horizontal)
    }
}
