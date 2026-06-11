//
//  HourlyForecastRow.swift
//  cleae_sky
//
//  Created by Ahmed Salah on 11/06/2026.
//
import SwiftUI

struct HourlyForecastRow: View {

    let hour: HourlyForecast
    let isNow: Bool

    var body: some View {
        HStack {

            Text(isNow ? "Now" : hour.time)
                .font(.headline)
                .foregroundColor(.white)
                .frame(width: 60, alignment: .leading)

            Spacer()

            WeatherIconView(
                icon: hour.weatherIcon,
                size: 40
            )

            Spacer()

            Text("\(Int(hour.temperature))°")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.white)
        }
        .padding(16)
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
    }
}
