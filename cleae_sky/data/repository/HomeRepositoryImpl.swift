//
//  HomeRepositoryImpl.swift
//  cleae_sky
//
//  Created by Ahmed Salah on 07/06/2026.
//

import Foundation

final class HomeRepositoryImpl: HomeRepository {


    private let remoteDataSource: WeatherRemoteDataSource


    init(remoteDataSource: WeatherRemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }


    func fetchHomeWeatherData(lat: Double,
                              lon: Double,
                              units: String = "metric",
                              lang: String = "en") async throws -> HomeWeatherData {

        async let currentDTO  = remoteDataSource.fetchCurrentWeather(lat: lat, lon: lon,
                                                                     units: units, lang: lang)
        async let forecastDTO = remoteDataSource.fetchForecast(lat: lat, lon: lon,
                                                               units: units, lang: lang)

        let (current, forecast) = try await (currentDTO, forecastDTO)

        let currentWeather = current.toDomain()
        let forecastDomain = forecast.toDomain()

        let dailySummaries = buildDailySummaries(from: forecastDomain.forecastItems,
                                                 timezone: forecastDomain.timezone)

        return HomeWeatherData(
            cityName: currentWeather.cityName,
            country: currentWeather.country,
            currentTemperature: currentWeather.temperature,
            weatherCondition: currentWeather.weatherCondition,
            weatherDescription: currentWeather.weatherDescription,
            weatherIcon: currentWeather.weatherIcon,
            tempMax: currentWeather.tempMax,
            tempMin: currentWeather.tempMin,
            humidity: currentWeather.humidity,
            visibility: currentWeather.visibility,
            feelsLike: currentWeather.feelsLike,
            pressure:  currentWeather.pressure,
            dailyForecasts: dailySummaries
        )
    }


    func fetchLocationName(lat: Double, lon: Double) async throws -> SearchLocation {
        let results = try await remoteDataSource.fetchLocationByCoordinates(lat: lat,
                                                                            lon: lon,
                                                                            limit: 1)
        guard let first = results.first else {
            throw APIError.noData
        }
        return first.toDomain()
    }

    func searchLocations(query: String) async throws -> [SearchLocation] {
        let results = try await remoteDataSource.searchLocationByName(query, limit: 5)
        return results.map { $0.toDomain() }
    }

    private func buildDailySummaries(from items: [ForecastItem],
                                     timezone: Int) -> [DailyForecastSummary] {

        let tzOffset = TimeInterval(timezone)
        var grouped: [String: [ForecastItem]] = [:]

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.timeZone = TimeZone(secondsFromGMT: Int(tzOffset))

        for item in items {
            let date = Date(timeIntervalSince1970: TimeInterval(item.timestamp) + tzOffset)
            let key  = formatter.string(from: date)
            grouped[key, default: []].append(item)
        }

        let sortedKeys = grouped.keys.sorted()
        let todayKey   = formatter.string(from: Date())

        var summaries: [DailyForecastSummary] = []

        for (index, key) in sortedKeys.enumerated() {
            guard let dayItems = grouped[key], !dayItems.isEmpty else { continue }
            guard summaries.count < 3 else { break }

            let minTemp  = dayItems.map(\.tempMin).min() ?? 0
            let maxTemp  = dayItems.map(\.tempMax).max() ?? 0

            let icon = dayItems
                .first(where: { $0.dateTime.contains("12:00:00") })?
                .weatherIcon ?? dayItems[0].weatherIcon

            let label: String
            if key == todayKey {
                label = "Today"
            } else if index == sortedKeys.firstIndex(of: todayKey).map({ $0 + 1 }) {
                label = "Tomorrow"
            } else {
                let date = Date(timeIntervalSince1970: TimeInterval(dayItems[0].timestamp))
                let wdFormatter = DateFormatter()
                wdFormatter.dateFormat = "EEE"
                wdFormatter.timeZone = TimeZone(secondsFromGMT: Int(tzOffset))
                label = wdFormatter.string(from: date)
            }

            summaries.append(DailyForecastSummary(dayLabel: label,
                                                   weatherIcon: icon,
                                                   tempMin: minTemp,
                                                   tempMax: maxTemp))
        }

        return summaries
    }
}
