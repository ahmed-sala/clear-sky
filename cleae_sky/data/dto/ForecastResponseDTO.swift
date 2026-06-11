

import Foundation

struct ForecastResponseDTO: Codable {
    let location: LocationDTO?
    let forecast: ForecastDTO?
}
