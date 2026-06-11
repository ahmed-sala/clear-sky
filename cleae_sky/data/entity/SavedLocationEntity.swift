//
//  SavedLocationEntity.swift
//  cleae_sky
//
//  Created by Ahmed Salah on 11/06/2026.
//

import SwiftData

@Model
final class SavedLocationEntity {

    var name: String
    var country: String
    var latitude: Double
    var longitude: Double

    init(
        name: String,
        country: String,
        latitude: Double,
        longitude: Double
    ) {
        self.name = name
        self.country = country
        self.latitude = latitude
        self.longitude = longitude
    }
}
