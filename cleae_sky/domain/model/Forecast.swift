//
//  Forecast.swift
//  cleae_sky
//
//  Created by Ahmed Salah on 05/06/2026.
//

import Foundation

struct Forecast: Equatable {
    let cityName: String
    let country: String
    let latitude: Double
    let longitude: Double

    let timezone: Int          
    let sunrise: Int       
    let sunset: Int        

    let forecastItems: [ForecastItem]
}
