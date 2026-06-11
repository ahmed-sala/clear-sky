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
        baseURL: "https://api.weatherapi.com/v1",
        apiKey: "1759209f520142e7929205611261006",
        timeoutInterval: 30
    )
}
