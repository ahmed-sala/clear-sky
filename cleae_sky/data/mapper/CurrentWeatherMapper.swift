

import Foundation

extension CurrentWeatherResponseDTO {

    func toDomain() -> CurrentWeather {

        CurrentWeather(
            id: stableLocationId,
            cityName: location?.name ?? "",
            country: location?.country ?? "",
            latitude: location?.lat ?? 0,
            longitude: location?.lon ?? 0,
            temperature: current?.tempC ?? 0,
            feelsLike: current?.feelslikeC ?? 0,
            tempMin: 0,
            tempMax: 0,
            pressure: Int(current?.pressureMb ?? 0),
            humidity: current?.humidity ?? 0,
            visibility: Int((current?.visKm ?? 0) * 1000),
            windSpeed: (current?.windKph ?? 0) / 3.6,
            windDegree: current?.windDegree ?? 0,
            cloudiness: current?.cloud ?? 0,
            weatherCondition: current?.condition?.text ?? "",
            weatherDescription: current?.condition?.text ?? "",
            weatherIcon: current?.condition?.icon.toIconURL ?? "",
            sunrise: 0,
            sunset: 0,
            timezone: location?.tzId.toUTCOffsetSeconds ?? 0,
            timestamp: current?.lastUpdatedEpoch ?? 0
        )
    }

    private var stableLocationId: Int {
        let lat = Int(((location?.lat ?? 0) * 10_000).rounded())
        let lon = Int(((location?.lon ?? 0) * 10_000).rounded())
        return lat &* 4_000_000 &+ lon
    }
}


extension Optional where Wrapped == String {

    var toIconURL: String {
        guard let self, !self.isEmpty else { return "" }
        return self.hasPrefix("//") ? "https:" + self : self
    }

    var toUTCOffsetSeconds: Int {
        guard let self,
              let timeZone = TimeZone(identifier: self) else { return 0 }
        return timeZone.secondsFromGMT()
    }
}
