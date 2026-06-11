//
//  ForecastRowView.swift
//  cleae_sky
//
//  Created by Ahmed Salah on 11/06/2026.
//

import SwiftUI

struct ForecastRowView: View {
    let forecast: DailyForecastSummary

    var body: some View {
        HStack(spacing: 0) {

            Text(forecast.dayLabel)
                .font(.system(size: 15, weight: .medium, design: .rounded))
                .foregroundColor(.primary)
                .frame(maxWidth: .infinity, alignment: .leading)

            WeatherIconView(icon: forecast.weatherIcon,size:40)
                .frame(width: 30, height: 30)

            HStack(spacing: 8) {
                Text("\(Int(forecast.tempMax))°")
                    .font(.system(size: 15, weight: .semibold, design: .rounded))
                    .foregroundColor(.primary)
                    .frame(width: 32, alignment: .trailing)

                Text("\(Int(forecast.tempMin))°")
                    .font(.system(size: 15, weight: .regular, design: .rounded))
                    .foregroundColor(.secondary)
                    .frame(width: 32, alignment: .trailing)
            }
            .frame(maxWidth: .infinity, alignment: .trailing)

        }
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
        .contentShape(Rectangle())
    }
}
