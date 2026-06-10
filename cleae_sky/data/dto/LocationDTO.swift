

import Foundation

struct LocationDTO: Codable {
    let name: String?
    let region: String?
    let country: String?
    let lat: Double?
    let lon: Double?
    let tzId: String?            
    let localtimeEpoch: Int64?
    let localtime: String?
}
