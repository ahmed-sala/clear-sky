//
//  ForecastItemDTO.swift
//  cleae_sky
//
//  Created by Ahmed Salah on 05/06/2026.
//
import Foundation

struct ForecastItemDTO: Codable {
    let dt: Int64?
    let main: MainDTO?
    let weather: [WeatherDTO]?
    let clouds: CloudsDTO?
    let wind: WindDTO?
    let visibility: Int?
    let pop: Double?
    let sys: ForecastSysDTO?
    let dtTxt: String?

    enum CodingKeys: String, CodingKey {
        case dt
        case main
        case weather
        case clouds
        case wind
        case visibility
        case pop
        case sys
        case dtTxt = "dt_txt"
    }
}
