//
//  LocationLocalDataSourceImpl.swift
//  cleae_sky
//
//  Created by Ahmed Salah on 11/06/2026.
//

import SwiftData

final class LocationLocalDataSourceImpl: LocationLocalDataSource {

    private let context: ModelContext

    init(context: ModelContext) {
        self.context = context
    }

    func save(_ location: SavedLocationEntity) throws {

        let descriptor = FetchDescriptor<SavedLocationEntity>()

        let existing = try context.fetch(descriptor)

        let alreadyExists = existing.contains {
            $0.name == location.name &&
            $0.latitude == location.latitude
        }

        guard !alreadyExists else { return }

        context.insert(location)

        try context.save()
    }

    func getAll() throws -> [SavedLocationEntity] {

        let descriptor = FetchDescriptor<SavedLocationEntity>()

        return try context.fetch(descriptor)
    }
    func delete(
        latitude: Double,
        longitude: Double
    ) throws {

        let descriptor =
            FetchDescriptor<SavedLocationEntity>()

        let locations =
            try context.fetch(descriptor)

        locations
            .filter {
                $0.latitude == latitude &&
                $0.longitude == longitude
            }
            .forEach {
                context.delete($0)
            }

        try context.save()
    }
}
