//
//  Forecast.swift
//  cleae_sky
//
//  Created by Ahmed Salah on 05/06/2026.
//

struct Forecast {
    let cityName: String
    let country: String
    let latitude: Double
    let longitude: Double
    let timezone: Int
    let sunrise: Int64
    let sunset: Int64
    let forecastItems: [ForecastItem]
}
