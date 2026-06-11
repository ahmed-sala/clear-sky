

import Foundation

struct CurrentDTO: Codable {
    let tempC: Double?
    let condition: ConditionDTO?
    let pressureMb: Double?
    let humidity: Int?
    let feelslikeC: Double?
    let visKm: Double?
}
