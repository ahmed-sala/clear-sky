

import Foundation

extension ForecastResponseDTO {

    func toDomain() -> Forecast {

        Forecast(
            timezone: location?.tzId.toUTCOffsetSeconds ?? 0,
            forecastItems: forecast?.forecastday?
                .flatMap { $0.hour ?? [] }
                .map { $0.toDomain() } ?? []
        )
    }
}
