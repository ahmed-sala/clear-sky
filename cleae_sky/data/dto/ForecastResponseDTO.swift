//
//  ForecastResponseDTO.swift
//  cleae_sky
//
//  Created by Ahmed Salah on 05/06/2026.
//

import Foundation

struct ForecastResponseDTO: Codable {
    let cod: String?
    let message: Int?
    let cnt: Int?
    let list: [ForecastItemDTO]?
    let city: CityDTO?
}
