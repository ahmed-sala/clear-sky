//
//  CurrentWeatherEntity.swift
//  cleae_sky
//
//  Created by Ahmed Salah on 05/06/2026.
//

import SwiftData

@Model
final class CurrentWeatherEntity {

    @Attribute(.unique)
    var id: Int64

    var cityName: String
    var country: String

    var latitude: Double
    var longitude: Double

    var temperature: Double
    var feelsLike: Double
    var tempMin: Double
    var tempMax: Double

    var pressure: Int
    var humidity: Int

    var visibility: Int

    var windSpeed: Double
    var windDegree: Int

    var cloudiness: Int

    var weatherCondition: String
    var weatherDescription: String
    var weatherIcon: String

    var sunrise: Int64
    var sunset: Int64

    var timezone: Int
    var timestamp: Int64

    init(
        id: Int64,
        cityName: String,
        country: String,
        latitude: Double,
        longitude: Double,
        temperature: Double,
        feelsLike: Double,
        tempMin: Double,
        tempMax: Double,
        pressure: Int,
        humidity: Int,
        visibility: Int,
        windSpeed: Double,
        windDegree: Int,
        cloudiness: Int,
        weatherCondition: String,
        weatherDescription: String,
        weatherIcon: String,
        sunrise: Int64,
        sunset: Int64,
        timezone: Int,
        timestamp: Int64
    ) {
        self.id = id
        self.cityName = cityName
        self.country = country
        self.latitude = latitude
        self.longitude = longitude
        self.temperature = temperature
        self.feelsLike = feelsLike
        self.tempMin = tempMin
        self.tempMax = tempMax
        self.pressure = pressure
        self.humidity = humidity
        self.visibility = visibility
        self.windSpeed = windSpeed
        self.windDegree = windDegree
        self.cloudiness = cloudiness
        self.weatherCondition = weatherCondition
        self.weatherDescription = weatherDescription
        self.weatherIcon = weatherIcon
        self.sunrise = sunrise
        self.sunset = sunset
        self.timezone = timezone
        self.timestamp = timestamp
    }
}
