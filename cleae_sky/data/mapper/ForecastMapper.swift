//
//  ForecastMapper.swift
//  cleae_sky
//
//  Created by Ahmed Salah on 05/06/2026.
//

import Foundation

extension ForecastResponseDTO {

    func toDomain() -> Forecast {

        Forecast(
            cityName: city?.name ?? "",
            country: city?.country ?? "",
            latitude: city?.coord?.lat ?? 0,
            longitude: city?.coord?.lon ?? 0,
            timezone: city?.timezone ?? 0,
            sunrise: city?.sunrise ?? 0,
            sunset: city?.sunset ?? 0,
            forecastItems: list?.map { $0.toDomain() } ?? []
        )
    }
}
