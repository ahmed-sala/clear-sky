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

    case currentWeather(lat: Double, lon: Double, units: String, lang: String)
    case forecast(lat: Double, lon: Double, units: String, lang: String)
    case geocodingByName(query: String, limit: Int)
    case geocodingByCoordinates(lat: Double, lon: Double, limit: Int)

    var path: String {
        switch self {
        case .currentWeather:
            return "/data/2.5/weather"
        case .forecast:  
            return "/data/2.5/forecast"
        case .geocodingByName:    
            return "/geo/1.0/direct"
        case .geocodingByCoordinates:  
            return "/geo/1.0/reverse"
        }
    }

    var method: HTTPMethod { .GET }

    var queryParameters: [String: String] {
        switch self {
        case .currentWeather(let lat, let lon, let units, let lang):
            return [
                "lat": "\(lat)",
                "lon": "\(lon)",
                "units": units,
                "lang": lang
            ]
        case .forecast(let lat, let lon, let units, let lang):
            return [
                "lat": "\(lat)",
                "lon": "\(lon)",
                "units": units,
                "lang": lang
            ]
        case .geocodingByName(let query, let limit):
            return [
                "q": query,
                "limit": "\(limit)"
            ]
        case .geocodingByCoordinates(let lat, let lon, let limit):
            return [
                "lat": "\(lat)",
                "lon": "\(lon)",
                "limit": "\(limit)"
            ]
        }
    }
}
