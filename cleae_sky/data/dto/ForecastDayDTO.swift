

import Foundation

struct ForecastDayDTO: Codable {
    let date: String?
    let dateEpoch: Int64?    
    let day: DayDTO?
    let astro: AstroDTO?
    let hour: [HourDTO]?
}
