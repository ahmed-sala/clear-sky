

import Foundation

struct CurrentWeatherResponseDTO: Codable {
    let location: LocationDTO?
    let current: CurrentDTO?
}
