//
//  CurrentWeather.swift
//  cleae_sky
//
//  Created by Ahmed Salah on 05/06/2026.
//

struct CurrentWeather {
    let id: Int64
    let cityName: String
    let country: String

    let latitude: Double
    let longitude: Double

    let temperature: Double
    let feelsLike: Double

    let tempMin: Double
    let tempMax: Double

    let pressure: Int
    let humidity: Int

    let visibility: Int

    let windSpeed: Double
    let windDegree: Int

    let cloudiness: Int

    let weatherCondition: String
    let weatherDescription: String
    let weatherIcon: String

    let sunrise: Int64
    let sunset: Int64

    let timezone: Int
    let timestamp: Int64
}
