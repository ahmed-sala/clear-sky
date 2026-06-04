//
//  GeocodingMapper.swift
//  cleae_sky
//
//  Created by Ahmed Salah on 05/06/2026.
//

import Foundation

extension GeocodingResponseDTO {

    func toDomain() -> SearchLocation {

        SearchLocation(
            name: name ?? "",
            latitude: lat ?? 0,
            longitude: lon ?? 0,
            country: country ?? "",
            state: state
        )
    }
}
