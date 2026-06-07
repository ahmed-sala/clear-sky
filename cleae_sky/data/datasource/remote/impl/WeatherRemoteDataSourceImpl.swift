//
//  WeatherRemoteDataSourceImpl.swift
//  cleae_sky
//
//  Created by Ahmed Salah on 07/06/2026.
//

final class WeatherRemoteDataSourceImpl: WeatherRemoteDataSource {


    private let apiService: APIService


    init(apiService: APIService) {
        self.apiService = apiService
    }


    func fetchCurrentWeather(lat: Double,
                             lon: Double,
                             units: String = "metric",
                             lang: String = "en") async throws -> CurrentWeatherResponseDTO {

        let endpoint = WeatherEndpoint.currentWeather(
            lat: lat, lon: lon, units: units, lang: lang
        )
        return try await apiService.request(endpoint)
    }


    func fetchForecast(lat: Double,
                       lon: Double,
                       units: String = "metric",
                       lang: String = "en") async throws -> ForecastResponseDTO {

        let endpoint = WeatherEndpoint.forecast(
            lat: lat, lon: lon, units: units, lang: lang
        )
        return try await apiService.request(endpoint)
    }


    func searchLocationByName(_ query: String,
                               limit: Int = 5) async throws -> [GeocodingResponseDTO] {

        let endpoint = WeatherEndpoint.geocodingByName(query: query, limit: limit)
        return try await apiService.request(endpoint)
    }


    func fetchLocationByCoordinates(lat: Double,
                                    lon: Double,
                                    limit: Int = 1) async throws -> [GeocodingResponseDTO] {

        let endpoint = WeatherEndpoint.geocodingByCoordinates(lat: lat, lon: lon, limit: limit)
        return try await apiService.request(endpoint)
    }
}
