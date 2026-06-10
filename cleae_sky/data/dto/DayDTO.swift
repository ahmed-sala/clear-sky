

import Foundation

struct DayDTO: Codable {
    let maxtempC: Double?
    let maxtempF: Double?
    let mintempC: Double?
    let mintempF: Double?
    let avgtempC: Double?
    let avgtempF: Double?
    let maxwindKph: Double?
    let maxwindMph: Double?
    let totalprecipMm: Double?
    let avgvisKm: Double?
    let avghumidity: Double?
    let dailyWillItRain: Int?
    let dailyChanceOfRain: Int?
    let dailyWillItSnow: Int?
    let dailyChanceOfSnow: Int?
    let condition: ConditionDTO?
    let uv: Double?
}
