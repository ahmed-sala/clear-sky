//
//  WeatherRemoteDataSourceImpl.swift
//  cleae_sky
//
//  Created by Ahmed Salah on 07/06/2026.
//

import Foundation

final class WeatherRemoteDataSourceImpl: WeatherRemoteDataSource {

    private let apiService: APIService

    private let forecastDays = 3

    init(apiService: APIService) {
        self.apiService = apiService
    }

    func fetchCurrentWeather(lat: Double,lon: Double,units: String = "metric",lang: String = "en") async throws -> CurrentWeatherResponseDTO {
        
        let endpoint = WeatherEndpoint.currentWeather(
            lat: lat, lon: lon, lang: lang
        )
        return try await apiService.request(endpoint)
    }

    func fetchForecast(lat: Double,
                       lon: Double,
                       units: String = "metric",
                       lang: String = "en") async throws -> ForecastResponseDTO {
        let endpoint = WeatherEndpoint.forecast(
            lat: lat, lon: lon, days: forecastDays, lang: lang
        )
        return try await apiService.request(endpoint)
    }

    func searchLocationByName(_ query: String,
                              limit: Int = 5) async throws -> [SearchLocationDTO] {
        let endpoint = WeatherEndpoint.searchByName(query: query)
        let results: [SearchLocationDTO] = try await apiService.request(endpoint)
        return Array(results.prefix(limit))
    }
}
