//
//  GeocodingResponseDTO.swift
//  cleae_sky
//
//  Created by Ahmed Salah on 05/06/2026.
//
import Foundation

struct GeocodingResponseDTO: Codable {
    let name: String?
    let localNames: [String: String]?
    let lat: Double?
    let lon: Double?
    let country: String?
    let state: String?

    enum CodingKeys: String, CodingKey {
        case name
        case localNames = "local_names"
        case lat
        case lon
        case country
        case state
    }
}
