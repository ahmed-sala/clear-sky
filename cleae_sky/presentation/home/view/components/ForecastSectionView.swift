//
//  ForecastSectionView.swift
//  cleae_sky
//
//  Created by Ahmed Salah on 11/06/2026.
//

import SwiftUI

struct ForecastSectionView: View {

    let dailyForecasts: [DailyForecastSummary]
    let hourlyForecasts: [HourlyForecast]

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

            ForEach(Array(dailyForecasts.prefix(3).enumerated()), id: \.offset) { index, forecast in

                NavigationLink {
                    ForecastDetailsView(
                        details: ForecastDetails(
                            selectedDay: forecast.dayLabel,
                            hourlyForecasts: hourlyForecasts
                        )
                    )
                } label: {
                    ForecastRowView(forecast: forecast)
                }
                .buttonStyle(.plain)

                if index < min(dailyForecasts.count, 3) - 1 {
                    Divider()
                        .background(Color.white.opacity(0.1))
                        .padding(.horizontal, 16)
                }
            }
        }
        .padding(.bottom, 6)

        .background(Color.black.opacity(0.15))
        .background(.ultraThinMaterial)
        .environment(\.colorScheme, .dark)

        .clipShape(
            RoundedRectangle(
                cornerRadius: 24,
                style: .continuous
            )
        )
        .overlay(
            RoundedRectangle(
                cornerRadius: 24,
                style: .continuous
            )
            .strokeBorder(
                Color.white.opacity(0.2),
                lineWidth: 0.5
            )
        )

        .padding(.horizontal, 16)
    }
}
