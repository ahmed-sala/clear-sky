//
//  WeatherSuccessView.swift
//  cleae_sky
//
//  Created by Ahmed Salah on 11/06/2026.
//
//
//  WeatherSuccessView.swift
//  cleae_sky
//
//  Created by Ahmed Salah on 11/06/2026.
//

import SwiftUI

struct WeatherSuccessView: View {
    let weather: HomeWeatherData

    var body: some View {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 24) {

                    WeatherHeaderView(
                        city: weather.cityName,
                        date: formattedDate,
                        temperature: Int(weather.currentTemperature),
                        condition: weather.weatherDescription.capitalized,
                        icon: weather.weatherIcon,
                        highTemp: Int(weather.tempMax),
                        lowTemp: Int(weather.tempMin)
                    )

                    WeatherDetailsGridView(weather: weather)

                    ForecastSectionView(
                        dailyForecasts: weather.dailyForecasts,
                        hourlyForecasts: weather.hourlyForecasts
                    )
                }
                .padding(.bottom, 40)
            }
        }


    private var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMMM d"
        return formatter.string(from: Date())
    }
}

#Preview {
    NavigationStack {
        WeatherSuccessView(
            weather: HomeWeatherData(
                cityName: "Cairo",
                country: "EG",
                currentTemperature: 28,
                weatherCondition: "Clear",
                weatherDescription: "Clear Sky",
                weatherIcon: "sun.max.fill",
                tempMax: 35,
                tempMin: 22,
                humidity: 45,
                visibility: 10,
                feelsLike: 29,
                pressure: 1012,
                dailyForecasts: [
                    DailyForecastSummary(
                        dayLabel: "Today",
                        weatherIcon: "sun.max.fill",
                        tempMin: 22,
                        tempMax: 35
                    ),
                    DailyForecastSummary(
                        dayLabel: "Fri",
                        weatherIcon: "cloud.sun.fill",
                        tempMin: 21,
                        tempMax: 33
                    ),
                    DailyForecastSummary(
                        dayLabel: "Sat",
                        weatherIcon: "sun.max.fill",
                        tempMin: 23,
                        tempMax: 36
                    )
                ],
                hourlyForecasts: []
            )
        )
    }
}
