//
//  CurrentWeatherDomainMapper.swift
//  cleae_sky
//
//  Created by Ahmed Salah on 07/06/2026.
//

extension CurrentWeatherEntity {

    func toDomain() -> CurrentWeather {
        CurrentWeather(
            id: id,
            cityName: cityName,
            country: country,
            latitude: latitude,
            longitude: longitude,
            temperature: temperature,
            feelsLike: feelsLike,
            tempMin: tempMin,
            tempMax: tempMax,
            pressure: pressure,
            humidity: humidity,
            visibility: visibility,
            windSpeed: windSpeed,
            windDegree: windDegree,
            cloudiness: cloudiness,
            weatherCondition: weatherCondition,
            weatherDescription: weatherDescription,
            weatherIcon: weatherIcon,
            sunrise: sunrise,
            sunset: sunset,
            timezone: timezone,
            timestamp: timestamp
        )
    }
}
