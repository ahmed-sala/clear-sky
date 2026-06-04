//
//  CurrentWeatherMapper.swift
//  cleae_sky
//
//  Created by Ahmed Salah on 05/06/2026.
//

import Foundation

extension CurrentWeatherResponseDTO {

    func toDomain() -> CurrentWeather {

        CurrentWeather(
            id: id ?? 0,
            cityName: name ?? "",
            country: sys?.country ?? "",
            latitude: coord?.lat ?? 0,
            longitude: coord?.lon ?? 0,
            temperature: main?.temp ?? 0,
            feelsLike: main?.feelsLike ?? 0,
            tempMin: main?.tempMin ?? 0,
            tempMax: main?.tempMax ?? 0,
            pressure: main?.pressure ?? 0,
            humidity: main?.humidity ?? 0,
            visibility: visibility ?? 0,
            windSpeed: wind?.speed ?? 0,
            windDegree: wind?.deg ?? 0,
            cloudiness: clouds?.all ?? 0,
            weatherCondition: weather?.first?.main ?? "",
            weatherDescription: weather?.first?.description ?? "",
            weatherIcon: weather?.first?.icon ?? "",
            sunrise: sys?.sunrise ?? 0,
            sunset: sys?.sunset ?? 0,
            timezone: timezone ?? 0,
            timestamp: dt ?? 0
        )
    }
}
