//
//  ForecastItem.swift
//  cleae_sky
//
//  Created by Ahmed Salah on 05/06/2026.
//

import Foundation

struct ForecastItem {
    let timestamp: Int64                     
    let dateTime: String                     

    let temperature: Double
    let feelsLike: Double
    let tempMin: Double
    let tempMax: Double

    let pressure: Int                        
    let humidity: Int                        
    let visibility: Int                      
    let windSpeed: Double                    
    let windDegree: Int                      
    let windGust: Double                    
    let cloudiness: Int                      
    let probabilityOfPrecipitation: Double   

    let weatherCondition: String
    let weatherDescription: String
    let weatherIcon: String                  

    let partOfDay: String                    
}
