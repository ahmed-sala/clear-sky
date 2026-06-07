//
//  CityDto.swift
//  cleae_sky
//
//  Created by Ahmed Salah on 07/06/2026.
//

struct CityDTO: Codable {
    let id: Int64?
    let name: String?
    let coord: CoordDTO?
    let country: String?
    let population: Int?
    let timezone: Int?
    let sunrise: Int64?
    let sunset: Int64?
}
