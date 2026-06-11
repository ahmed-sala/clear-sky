//
//  APIEndpoint.swift
//  cleae_sky
//
//  Created by Ahmed Salah on 07/06/2026.
//

enum HTTPMethod: String {
    case GET
    case POST
    case PUT
    case DELETE
}


protocol APIEndpoint {
    var path: String { get }
    var method: HTTPMethod { get }
    var queryParameters: [String: String] { get }
}
enum WeatherEndpoint: APIEndpoint {

    case currentWeather(lat: Double, lon: Double, lang: String)
    case forecast(lat: Double, lon: Double, days: Int, lang: String)
    case searchByName(query: String)
    case searchByCoordinates(lat: Double, lon: Double)

    var path: String {
        switch self {
        case .currentWeather:
            return "/current.json"
        case .forecast:
            return "/forecast.json"
        case .searchByName, .searchByCoordinates:
            return "/search.json"
        }
    }

    var method: HTTPMethod {
        .GET
    }

    var queryParameters: [String: String] {
        switch self {

        case let .currentWeather(lat, lon, lang):
            return [
                "q": "\(lat),\(lon)",
                "lang": lang
            ]

        case let .forecast(lat, lon, days, lang):
            return [
                "q": "\(lat),\(lon)",
                "days": "\(days)",
                "lang": lang,
                "aqi": "no",
                "alerts": "no"
            ]

        case let .searchByName(query):
            return ["q": query]

        case let .searchByCoordinates(lat, lon):
            return ["q": "\(lat),\(lon)"]
        }
    }
}
