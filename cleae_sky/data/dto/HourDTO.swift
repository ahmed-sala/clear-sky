

import Foundation

struct HourDTO: Codable {
    let timeEpoch: Int64?
    let time: String?
    let tempC: Double?
    let condition: ConditionDTO?
}
