//
//  WeatherRemoteDataSource.swift
//  cleae_sky
//
//  Created by Ahmed Salah on 07/06/2026.
//

protocol WeatherRemoteDataSource {

    func fetchCurrentWeather(lat: Double,lon: Double,units: String,lang: String) async throws -> CurrentWeatherResponseDTO

    func fetchForecast(lat: Double,lon: Double,units: String,lang: String) async throws -> ForecastResponseDTO

    func searchLocationByName(_ query: String,limit: Int) async throws -> [SearchLocationDTO]

    func fetchLocationByCoordinates(lat: Double,lon: Double,limit: Int) async throws -> [SearchLocationDTO]
}
