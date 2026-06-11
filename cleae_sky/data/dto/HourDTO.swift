

import Foundation

struct HourDTO: Codable {
    let timeEpoch: Int64?
    let time: String?
    let tempC: Double?
    let tempF: Double?
    let isDay: Int?
    let condition: ConditionDTO?
    let windKph: Double?
    let windMph: Double?
    let windDegree: Int?
    let windDir: String?
    let pressureMb: Double?
    let precipMm: Double?
    let humidity: Int?
    let cloud: Int?
    let feelslikeC: Double?
    let feelslikeF: Double?
    let willItRain: Int?
    let chanceOfRain: Int?     
    let willItSnow: Int?
    let chanceOfSnow: Int?
    let visKm: Double?
    let gustKph: Double?
    let gustMph: Double?
    let uv: Double?
}
