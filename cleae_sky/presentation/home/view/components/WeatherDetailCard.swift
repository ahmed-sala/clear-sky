//
//  WeatherDetailCard.swift
//  cleae_sky
//
//  Created by Ahmed Salah on 11/06/2026.
//

import SwiftUI

struct WeatherDetailCard: View {
    let icon: String
    let title: String
    let value: String
    let unit: String
    let description: String

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {

            HStack(spacing: 6) {
                Image(systemName: icon)
                    .font(.system(size: 14, weight: .medium))

                Text(title.uppercased())
                    .font(.system(size: 12, weight: .semibold))
                    .kerning(0.5)
            }
            .foregroundColor(.white.opacity(0.7))
            .padding(.bottom, 16)

            Spacer(minLength: 0)

            HStack(alignment: .firstTextBaseline, spacing: 2) {
                Text(value)
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(.white)

                if !unit.isEmpty {
                    Text(unit)
                        .font(.system(size: unit == "%" || unit == "°" ? 38 : 22, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                }
            }
            .padding(.bottom, 8)

            Text(description)
                .font(.system(size: 13, weight: .regular, design: .rounded))
                .foregroundColor(.white.opacity(0.8))
                .lineLimit(2)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding(16)
        .frame(maxWidth: .infinity, minHeight: 140, alignment: .leading)

        .background(Color.black.opacity(0.15))
        .background(.ultraThinMaterial)
        .environment(\.colorScheme, .dark)

        .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 24, style: .continuous)
                .strokeBorder(Color.white.opacity(0.2), lineWidth: 0.5)
        )
    }
}
