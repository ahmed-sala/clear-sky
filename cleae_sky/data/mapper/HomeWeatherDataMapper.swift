//
//  HomeWeatherDataMapper.swift
//  cleae_sky
//
//  Created by Ahmed Salah on 07/06/2026.
//

extension HomeWeatherData {

    func toEntity() -> HomeWeatherDataEntity {

        HomeWeatherDataEntity(
            cityName: cityName,
            country: country,
            currentTemperature: currentTemperature,
            weatherCondition: weatherCondition,
            weatherDescription: weatherDescription,
            weatherIcon: weatherIcon,
            tempMax: tempMax,
            tempMin: tempMin,
            humidity: humidity,
            visibility: visibility,
            feelsLike: feelsLike,
            pressure: pressure,
            dailyForecasts: dailyForecasts.map {
                DailyForecastEntity(
                    dayLabel: $0.dayLabel,
                    weatherIcon: $0.weatherIcon,
                    tempMin: $0.tempMin,
                    tempMax: $0.tempMax
                )
            }
        )
    }
}
extension HomeWeatherDataEntity {

    func toDomain() -> HomeWeatherData {

        HomeWeatherData(
            cityName: cityName,
            country: country,
            currentTemperature: currentTemperature,
            weatherCondition: weatherCondition,
            weatherDescription: weatherDescription,
            weatherIcon: weatherIcon,
            tempMax: tempMax,
            tempMin: tempMin,
            humidity: humidity,
            visibility: visibility,
            feelsLike: feelsLike,
            pressure: pressure,
            dailyForecasts: dailyForecasts.map {
                DailyForecastSummary(
                    dayLabel: $0.dayLabel,
                    weatherIcon: $0.weatherIcon,
                    tempMin: $0.tempMin,
                    tempMax: $0.tempMax
                )
            }
        )
    }
}
