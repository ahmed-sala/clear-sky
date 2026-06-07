//
//  APIConfiguration.swift
//  cleae_sky
//
//  Created by Ahmed Salah on 07/06/2026.
//

import Foundation

struct APIConfiguration {
    let baseURL: String
    let apiKey: String
    let timeoutInterval: TimeInterval

    static let `default` = APIConfiguration(
        baseURL: "https://api.openweathermap.org",
        apiKey: "",
        timeoutInterval: 30
    )
}
