

import Foundation

extension CurrentWeatherResponseDTO {

    func toDomain() -> CurrentWeather {

        CurrentWeather(
            cityName: location?.name ?? "",
            temperature: current?.tempC ?? 0,
            feelsLike: current?.feelslikeC ?? 0,
            pressure: Int(current?.pressureMb ?? 0),
            humidity: current?.humidity ?? 0,
            visibility: Int(current?.visKm ?? 0),
            weatherDescription: current?.condition?.text ?? "",
            weatherIcon: current?.condition?.icon.toIconURL ?? ""
        )
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
