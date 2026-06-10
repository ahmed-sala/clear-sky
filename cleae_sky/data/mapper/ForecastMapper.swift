

import Foundation

extension ForecastResponseDTO {

    func toDomain() -> Forecast {

        let timeZone = (location?.tzId).flatMap { TimeZone(identifier: $0) }
        let firstDay = forecast?.forecastday?.first

        return Forecast(
            cityName: location?.name ?? "",
            country: location?.country ?? "",
            latitude: location?.lat ?? 0,
            longitude: location?.lon ?? 0,
            timezone: location?.tzId.toUTCOffsetSeconds ?? 0,
            sunrise: Self.epoch(date: firstDay?.date,
                                localTime: firstDay?.astro?.sunrise,
                                timeZone: timeZone),
            sunset: Self.epoch(date: firstDay?.date,
                               localTime: firstDay?.astro?.sunset,
                               timeZone: timeZone),
            forecastItems: forecast?.forecastday?
                .flatMap { $0.hour ?? [] }
                .map { $0.toDomain() } ?? []
        )
    }

    private static func epoch(date: String?,
                              localTime: String?,
                              timeZone: TimeZone?) -> Int {
        guard let date, let localTime else { return 0 }

        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd hh:mm a"
        formatter.timeZone = timeZone ?? .current

        guard let parsed = formatter.date(from: "\(date) \(localTime)") else {
            return 0
        }
        return Int(parsed.timeIntervalSince1970)
    }
}
