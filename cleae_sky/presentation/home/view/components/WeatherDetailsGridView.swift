//
//  WeatherDetailsGridView.swift
//  cleae_sky
//
//  Created by Ahmed Salah on 11/06/2026.
//

import SwiftUI

struct WeatherDetailsGridView: View {
    let weather: HomeWeatherData

    private let columns = [
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12)
    ]

    var body: some View {
        LazyVGrid(columns: columns, spacing: 12) {

            WeatherDetailCard(
                icon: "eye",
                title: "Visibility",
                value: "\(weather.visibility)",
                unit: "km",
                description: visibilityDescription(for: weather.visibility)
            )

            WeatherDetailCard(
                icon: "drop",
                title: "Humidity",
                value: "\(weather.humidity)",
                unit: "%",
                description: "Comfortable levels."
            )

            WeatherDetailCard(
                icon: "thermometer",
                title: "Feels Like",
                value: "\(Int(weather.feelsLike))",
                unit: "°",
                description: "Slightly warmer than actual."
            )

            WeatherDetailCard(
                icon: "gauge",
                title: "Pressure",
                value: "\(weather.pressure)",
                unit: "",
                description: "hPa. Steady."
            )
        }
        .padding(.horizontal, 16)
    }

    private func visibilityDescription(for distance: Int) -> String {
        if distance >= 10 {
            return "Perfectly clear view."
        } else if distance >= 5 {
            return "Moderate visibility."
        } else {
            return "Reduced visibility."
        }
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()

        WeatherDetailsGridView(weather: HomeWeatherData(
            cityName: "Cairo",
            currentTemperature: 28,
            weatherDescription: "clear sky",
            weatherIcon: "sun.max.fill",
            tempMax: 35,
            tempMin: 22,
            humidity: 45,
            visibility: 10,
            feelsLike: 29,
            pressure: 1012,

            dailyForecasts: []
            , hourlyForecasts: []
        ))
    }
}
