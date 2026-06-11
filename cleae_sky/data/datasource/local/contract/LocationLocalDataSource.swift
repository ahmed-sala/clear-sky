//
//  LocationLocalDataSource.swift
//  cleae_sky
//
//  Created by Ahmed Salah on 11/06/2026.
//

protocol LocationLocalDataSource {
    func save(_ location: SavedLocationEntity) throws
    func getAll() throws -> [SavedLocationEntity]
    func delete(latitude: Double,longitude: Double) throws
}
