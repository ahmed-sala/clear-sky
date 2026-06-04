//
//  ForecastItemMapper.swift
//  cleae_sky
//
//  Created by Ahmed Salah on 05/06/2026.
//

import Foundation

extension ForecastItemDTO {

    func toDomain() -> ForecastItem {

        ForecastItem(
            timestamp: dt ?? 0,
            dateTime: dtTxt ?? "",
            temperature: main?.temp ?? 0,
            feelsLike: main?.feelsLike ?? 0,
            tempMin: main?.tempMin ?? 0,
            tempMax: main?.tempMax ?? 0,
            pressure: main?.pressure ?? 0,
            humidity: main?.humidity ?? 0,
            visibility: visibility ?? 0,
            windSpeed: wind?.speed ?? 0,
            windDegree: wind?.deg ?? 0,
            windGust: wind?.gust ?? 0,
            cloudiness: clouds?.all ?? 0,
            probabilityOfPrecipitation: pop ?? 0,
            weatherCondition: weather?.first?.main ?? "",
            weatherDescription: weather?.first?.description ?? "",
            weatherIcon: weather?.first?.icon ?? "",
            partOfDay: sys?.pod ?? ""
        )
    }
}
