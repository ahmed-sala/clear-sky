//
//  HomeRepositoryImpl.swift
//  cleae_sky
//
//  Created by Ahmed Salah on 07/06/2026.
//

import Foundation

final class HomeRepositoryImpl: HomeRepository {

    private let remoteDataSource: WeatherRemoteDataSource
    private let localDataSource: HomeWeatherLocalDataSource

    init(
        remoteDataSource: WeatherRemoteDataSource,
        localDataSource: HomeWeatherLocalDataSource
    ) {
        self.remoteDataSource = remoteDataSource
        self.localDataSource = localDataSource
    }

    func fetchHomeWeatherData(
        lat: Double,
        lon: Double,
        units: String = "metric",
        lang: String = "en"
    ) async throws -> HomeWeatherData {

        do {

            async let currentDTO = remoteDataSource.fetchCurrentWeather(
                lat: lat,
                lon: lon,
                units: units,
                lang: lang
            )

            async let forecastDTO = remoteDataSource.fetchForecast(
                lat: lat,
                lon: lon,
                units: units,
                lang: lang
            )

            let (current, forecast) = try await (currentDTO, forecastDTO)

            let homeData = buildHomeWeatherData(
                current: current.toDomain(),
                forecast: forecast.toDomain()
            )

            try? localDataSource.save(
                homeData.toEntity()
            )

            return homeData

        } catch {

            if let cachedEntity = try? localDataSource.getCachedHomeData() {
                return cachedEntity.toDomain()
            }

            throw error
        }
    }

    func fetchLocationName(
        lat: Double,
        lon: Double
    ) async throws -> SearchLocation {

        let results = try await remoteDataSource.fetchLocationByCoordinates(
            lat: lat,
            lon: lon,
            limit: 1
        )

        guard let first = results.first else {
            throw APIError.noData
        }

        return first.toDomain()
    }

    func searchLocations(
        query: String
    ) async throws -> [SearchLocation] {

        let results = try await remoteDataSource.searchLocationByName(
            query,
            limit: 5
        )

        return results.map { $0.toDomain() }
    }
}


private extension HomeRepositoryImpl {

    func buildHomeWeatherData(
        current: CurrentWeather,
        forecast: Forecast
    ) -> HomeWeatherData {

        let dailySummaries = buildDailySummaries(
            from: forecast.forecastItems,
            timezone: forecast.timezone
        )

        let hourlyForecasts = buildHourlyForecasts(
            from: forecast.forecastItems,
            current: current
        )

        let today = dailySummaries.first

        return HomeWeatherData(
            cityName: current.cityName,
            country: current.country,
            currentTemperature: current.temperature,
            weatherCondition: current.weatherCondition,
            weatherDescription: current.weatherDescription,
            weatherIcon: current.weatherIcon,
            tempMax: today?.tempMax ?? current.temperature,
            tempMin: today?.tempMin ?? current.temperature,
            humidity: current.humidity,
            visibility: current.visibility,
            feelsLike: current.feelsLike,
            pressure: current.pressure,
            dailyForecasts: dailySummaries,
            hourlyForecasts: hourlyForecasts
        )
    }

    func buildDailySummaries(
        from items: [ForecastItem],
        timezone: Int
    ) -> [DailyForecastSummary] {


        var grouped: [String: [ForecastItem]] = [:]

        for item in items {
            guard item.dateTime.count >= 10 else { continue }
            let key = String(item.dateTime.prefix(10))
            grouped[key, default: []].append(item)
        }

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.timeZone = TimeZone(secondsFromGMT: timezone)

        let sortedKeys = grouped.keys.sorted()
        let todayKey = formatter.string(from: Date())

        var summaries: [DailyForecastSummary] = []

        for (index, key) in sortedKeys.enumerated() {

            guard let dayItems = grouped[key],
                  !dayItems.isEmpty else {
                continue
            }

            guard summaries.count < 3 else {
                break
            }

            let minTemp = dayItems.map(\.tempMin).min() ?? 0
            let maxTemp = dayItems.map(\.tempMax).max() ?? 0

            let icon = dayItems.first {
                $0.dateTime.contains("12:00:00")
            }?.weatherIcon ?? dayItems[0].weatherIcon

            let label: String

            if key == todayKey {

                label = "Today"

            } else if index == sortedKeys.firstIndex(of: todayKey).map({ $0 + 1 }) {

                label = "Tomorrow"

            } else {

                let date = Date(
                    timeIntervalSince1970: TimeInterval(dayItems[0].timestamp)
                )

                let dayFormatter = DateFormatter()
                dayFormatter.dateFormat = "EEE"
                dayFormatter.timeZone = TimeZone(secondsFromGMT: timezone)

                label = dayFormatter.string(from: date)
            }

            summaries.append(
                DailyForecastSummary(
                    dayLabel: label,
                    weatherIcon: icon,
                    tempMin: minTemp,
                    tempMax: maxTemp
                )
            )
        }

        return summaries
    }
    private func buildHourlyForecasts(
        from items: [ForecastItem],
        current: CurrentWeather
    ) -> [HourlyForecast] {

        let now = Date().timeIntervalSince1970

        let nowForecast = HourlyForecast(
            time: "Now",
            temperature: current.temperature,
            weatherIcon: current.weatherIcon
        )

        let upcoming = items
            .filter { TimeInterval($0.timestamp) > now }
            .prefix(4)
            .map { item in
                HourlyForecast(
                    time: formatHour(from: Int(item.timestamp)),
                    temperature: item.temperature,
                    weatherIcon: item.weatherIcon
                )
            }

        return [nowForecast] + upcoming
    }
    private func formatHour(
        from timestamp: Int
    ) -> String {

        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"

        return formatter.string(
            from: Date(
                timeIntervalSince1970: TimeInterval(timestamp)
            )
        )
    }
}
