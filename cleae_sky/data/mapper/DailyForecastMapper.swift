//
//  DailyForecastMapper.swift
//  cleae_sky
//
//  Created by Ahmed Salah on 11/06/2026.
//

import Foundation

extension DailyForecastSummary {

    func toEntity() -> DailyForecastEntity {

        DailyForecastEntity(
            dayLabel: dayLabel,
            weatherIcon: weatherIcon,
            tempMin: tempMin,
            tempMax: tempMax
        )
    }
}

extension DailyForecastEntity {

    func toDomain() -> DailyForecastSummary {

        DailyForecastSummary(
            dayLabel: dayLabel,
            weatherIcon: weatherIcon,
            tempMin: tempMin,
            tempMax: tempMax
        )
    }
}
