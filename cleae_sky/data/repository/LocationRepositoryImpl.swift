//
//  LocationRepositoryImpl.swift
//  cleae_sky
//
//  Created by Ahmed Salah on 11/06/2026.
//



import Foundation

final class LocationRepositoryImpl: LocationRepository {

    private let remoteDataSource: WeatherRemoteDataSource
    private let localDataSource: LocationLocalDataSource

    init(
        remoteDataSource: WeatherRemoteDataSource,
        localDataSource: LocationLocalDataSource
    ) {
        self.remoteDataSource = remoteDataSource
        self.localDataSource = localDataSource
    }

    func searchLocations(
        query: String
    ) async throws -> [SearchLocation] {

        let locations = try await remoteDataSource
            .searchLocationByName(query, limit: 10)

        return locations.map {
            $0.toDomain()
        }
    }

    func getSavedLocations() throws -> [SearchLocation] {

        let entities = try localDataSource.getAll()

        return entities.map {
            SearchLocation(
                name: $0.name,
                latitude: $0.latitude,
                longitude: $0.longitude,
                country: $0.country
            )
        }
    }

    func saveLocation(
        _ location: SearchLocation
    ) throws {

        let entity = SavedLocationEntity(
            name: location.name,
            country: location.country,
            latitude: location.latitude,
            longitude: location.longitude
        )

        try localDataSource.save(entity)
    }
    func deleteLocation(
        _ location: SearchLocation
    ) throws {

        try localDataSource.delete(
            latitude: location.latitude,
            longitude: location.longitude
        )
    }
}
