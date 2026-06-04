//
//  CurrentWeatherResponseDTO.swift
//  cleae_sky
//
//  Created by Ahmed Salah on 05/06/2026.
//

import Foundation

struct CurrentWeatherResponseDTO: Codable {
    let coord: CoordDTO?
    let weather: [WeatherDTO]?
    let main: MainDTO?
    let visibility: Int?
    let wind: WindDTO?
    let clouds: CloudsDTO?
    let dt: Int64?
    let sys: SysDTO?
    let timezone: Int?
    let id: Int64?
    let name: String?
}
