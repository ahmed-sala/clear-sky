//
//  SearchLocation.swift
//  cleae_sky
//
//  Created by Ahmed Salah on 05/06/2026.
//

struct SearchLocation: Identifiable {
    let name: String
    let latitude: Double
    let longitude: Double
    let country: String

    var id: String {
        "\(name)-\(latitude)-\(longitude)"
    }
}
