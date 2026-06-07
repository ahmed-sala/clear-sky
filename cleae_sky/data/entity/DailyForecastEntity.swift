//
//  DailyForecastEntity.swift
//  cleae_sky
//
//  Created by Ahmed Salah on 07/06/2026.
//

import SwiftData

@Model
final class DailyForecastEntity {

    var dayLabel: String
    var weatherIcon: String
    var tempMin: Double
    var tempMax: Double

    init(
        dayLabel: String,
        weatherIcon: String,
        tempMin: Double,
        tempMax: Double
    ) {
        self.dayLabel = dayLabel
        self.weatherIcon = weatherIcon
        self.tempMin = tempMin
        self.tempMax = tempMax
    }
}
