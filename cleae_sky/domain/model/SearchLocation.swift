//
//  SearchLocation.swift
//  cleae_sky
//
//  Created by Ahmed Salah on 05/06/2026.
//

struct SearchLocation: Equatable, Hashable, Identifiable {
    let name: String
    let latitude: Double
    let longitude: Double
    let country: String
    let state: String?         
    var id: String {
        "\(name)-\(latitude)-\(longitude)"
    }

    var displayName: String {
        [name, state, country]
            .compactMap { $0 }
            .filter { !$0.isEmpty }
            .joined(separator: ", ")
    }
}
