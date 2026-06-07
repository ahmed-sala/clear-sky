//
//  HomeRepository.swift
//  cleae_sky
//
//  Created by Ahmed Salah on 07/06/2026.
//

protocol HomeRepository {
    func fetchHomeWeatherData(lat: Double,
                              lon: Double,
                              units: String,
                              lang: String) async throws -> HomeWeatherData

    func fetchLocationName(lat: Double,
                           lon: Double) async throws -> SearchLocation

    func searchLocations(query: String) async throws -> [SearchLocation]
}
