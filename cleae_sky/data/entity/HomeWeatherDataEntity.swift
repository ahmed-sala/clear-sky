//
//  HomeWeatherDataEntity.swift
//  cleae_sky
//
//  Created by Ahmed Salah on 07/06/2026.
//
import SwiftData

@Model
final class HomeWeatherDataEntity {

    @Attribute(.unique)
    var id: String

    var cityName: String

    var currentTemperature: Double
    var weatherDescription: String
    var weatherIcon: String
    var tempMax: Double
    var tempMin: Double
    var humidity: Int
    var visibility: Int
    var feelsLike: Double
    var pressure: Int

    @Relationship(deleteRule: .cascade)
    var dailyForecasts: [DailyForecastEntity]

    init(
        id: String = "home_weather",
        cityName: String,
        currentTemperature: Double,
        weatherDescription: String,
        weatherIcon: String,
        tempMax: Double,
        tempMin: Double,
        humidity: Int,
        visibility: Int,
        feelsLike: Double,
        pressure: Int,
        dailyForecasts: [DailyForecastEntity]
    ) {
        self.id = id
        self.cityName = cityName
        self.currentTemperature = currentTemperature
        self.weatherDescription = weatherDescription
        self.weatherIcon = weatherIcon
        self.tempMax = tempMax
        self.tempMin = tempMin
        self.humidity = humidity
        self.visibility = visibility
        self.feelsLike = feelsLike
        self.pressure = pressure
        self.dailyForecasts = dailyForecasts
    }
}
