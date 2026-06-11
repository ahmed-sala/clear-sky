//
//  ForecastCardView.swift
//  cleae_sky
//
//  Created by Ahmed Salah on 11/06/2026.
//


import SwiftUI

struct ForecastCardView: View {
    let forecasts: [DailyForecastSummary]
    let onDayTap: (DailyForecastSummary) -> Void

    var body: some View {
        VStack(spacing: 0) {

            HStack(spacing: 6) {
                Image(systemName: "calendar")
                    .font(.system(size: 10, weight: .semibold))
                    .foregroundColor(.secondary)

                Text("3-DAY FORECAST")
                    .font(.system(size: 10, weight: .bold))
                    .kerning(0.8)
                    .foregroundColor(.secondary)

                Spacer()
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 10)

            Divider()
                .background(Color.white.opacity(0.15))
                .padding(.horizontal, 16)

            let capped = Array(forecasts.prefix(3))
            ForEach(Array(capped.enumerated()), id: \.offset) { index, forecast in
                Button {
                    onDayTap(forecast)
                } label: {
                    ForecastRowView(forecast: forecast)
                }
                .buttonStyle(.plain)

                if index < capped.count - 1 {
                    Divider()
                        .background(Color.white.opacity(0.1))
                        .padding(.horizontal, 16)
                }
            }
        }
        .padding(.bottom, 6)
        .background(Color.white.opacity(0.05))
        .background(.ultraThinMaterial)
        .environment(\.colorScheme, .dark)
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .strokeBorder(Color.white.opacity(0.2), lineWidth: 0.5)
        )
        .padding(.horizontal, 16)
    }
}
