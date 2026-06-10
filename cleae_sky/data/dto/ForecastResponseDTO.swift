

import Foundation

struct ForecastResponseDTO: Codable {
    let location: LocationDTO?
    let current: CurrentDTO?
    let forecast: ForecastDTO?
}
