//
//  HomeWeatherDataMapper.swift
//  cleae_sky
//
//  Created by Ahmed Salah on 11/06/2026.
//

import Foundation

extension HomeWeatherData {

    func toEntity() -> HomeWeatherDataEntity {

        HomeWeatherDataEntity(
            cityName: cityName,
            currentTemperature: currentTemperature,
            weatherDescription: weatherDescription,
            weatherIcon: weatherIcon,
            tempMax: tempMax,
            tempMin: tempMin,
            humidity: humidity,
            visibility: visibility,
            feelsLike: feelsLike,
            pressure: pressure,
            dailyForecasts: dailyForecasts.map {
                $0.toEntity()
            }
        )
    }
}

extension HomeWeatherDataEntity {

    func toDomain() -> HomeWeatherData {

        HomeWeatherData(
            cityName: cityName,
            currentTemperature: currentTemperature,
            weatherDescription: weatherDescription,
            weatherIcon: weatherIcon,
            tempMax: tempMax,
            tempMin: tempMin,
            humidity: humidity,
            visibility: visibility,
            feelsLike: feelsLike,
            pressure: pressure,
            dailyForecasts: dailyForecasts.map {
                $0.toDomain()
            },
            hourlyForecasts: []
        )
    }
}
