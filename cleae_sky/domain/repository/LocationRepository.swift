//
//  LocationRepository.swift
//  cleae_sky
//
//  Created by Ahmed Salah on 11/06/2026.
//


import Foundation

protocol LocationRepository {

    func searchLocations(
        query: String
    ) async throws -> [SearchLocation]

    func getSavedLocations() throws -> [SearchLocation]

    func saveLocation(
        _ location: SearchLocation
    ) throws
    func deleteLocation(
        _ location: SearchLocation
    ) throws
}
