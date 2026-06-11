//
//  WeatherHeaderView.swift
//  cleae_sky
//
//  Created by Ahmed Salah on 11/06/2026.
//

import SwiftUI

struct WeatherHeaderView: View {
    let city: String
    let date: String
    let temperature: Int
    let condition: String
    let icon: String
    let highTemp: Int
    let lowTemp: Int

    var body: some View {
        VStack(spacing: 4) {

            Text(city)
                .font(.system(size: 34, weight: .medium,))
                .foregroundStyle(.white)

            Text(date)
                .font(.system(size: 16, weight: .regular,))
                .foregroundStyle(.white.opacity(0.8))
                .padding(.bottom, 8)

            HStack(alignment: .top, spacing: 0) {
                Text("\(temperature)")
                    .font(.system(size: 100, weight: .thin,))
                    .foregroundStyle(.white)

                Text("°")
                    .font(.system(size: 80, weight: .thin, ))
                    .foregroundStyle(.white)
                    .baselineOffset(10)
            }
            .padding(.bottom, -8)

            HStack(spacing: 8) {
                WeatherIconView(icon: icon)
                    .frame(width: 32, height: 32)

                Text(condition)
                    .font(.system(size: 22, weight: .semibold, ))
                    .foregroundStyle(.white)
            }
            .padding(.bottom, 4)

            HStack(spacing: 16) {
                Text("H: \(highTemp)°")
                Text("L: \(lowTemp)°")
            }
            .font(.system(size: 18, weight: .medium))
            .foregroundStyle(.white.opacity(0.8))

        }
        .frame(maxWidth: .infinity)
        .padding(.top, 60)
    }
}

#Preview {
    ZStack {
        Color.blue.ignoresSafeArea()

        WeatherHeaderView(
            city: "Cairo",
            date: "Thursday, June 11",
            temperature: 35,
            condition: "Sunny",
            icon: "sun.max.fill",
            highTemp: 38,
            lowTemp: 22
        )
    }
}
