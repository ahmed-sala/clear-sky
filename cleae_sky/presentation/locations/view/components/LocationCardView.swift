//
//  LocationCardView.swift
//  cleae_sky
//
//  Created by Ahmed Salah on 11/06/2026.
//

import SwiftUI

struct LocationCardView: View {

    let location: SearchLocation
    let isSaved: Bool

    var body: some View {

        HStack {

            VStack(
                alignment: .leading,
                spacing: 6
            ) {

                Text(location.name)
                    .font(.headline)
                    .foregroundStyle(.white)

                Text(location.country)
                    .font(.subheadline)
                    .foregroundStyle(
                        .white.opacity(0.7)
                    )
            }

            Spacer()

            if isSaved {

                Image(
                    systemName: "checkmark.circle.fill"
                )
                .font(.system(size: 24))
                .foregroundStyle(.green)
            }
        }
        .padding(18)
        .frame(maxWidth: .infinity)
        .glassCardStyle()
    }
}
