//
//  HomeWeatherData.swift
//  cleae_sky
//
//  Created by Ahmed Salah on 07/06/2026.
//

import Foundation

struct HomeWeatherData {
    let cityName: String
    let country: String

    let currentTemperature: Double
    let weatherCondition: String
    let weatherDescription: String
    let weatherIcon: String

    let tempMax: Double
    let tempMin: Double
    let humidity: Int
    let visibility: Int
    let feelsLike: Double
    let pressure: Int

    let dailyForecasts: [DailyForecastSummary]

    let hourlyForecasts: [HourlyForecast]
}

struct DailyForecastSummary : Identifiable{
    let id = UUID()

    let dayLabel: String
    let weatherIcon: String    
    let tempMin: Double
    let tempMax: Double
}
