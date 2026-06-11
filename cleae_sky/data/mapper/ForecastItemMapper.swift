

import Foundation

extension HourDTO {

    func toDomain() -> ForecastItem {

        ForecastItem(
            timestamp: timeEpoch ?? 0,
            dateTime: time.map { $0 + ":00" } ?? "",
            temperature: tempC ?? 0,
            feelsLike: feelslikeC ?? 0,
            tempMin: tempC ?? 0,
            tempMax: tempC ?? 0,
            pressure: Int(pressureMb ?? 0),
            humidity: humidity ?? 0,
            visibility: Int((visKm ?? 0) * 1000),
            windSpeed: (windKph ?? 0) / 3.6,
            windDegree: windDegree ?? 0,
            windGust: (gustKph ?? 0) / 3.6,
            cloudiness: cloud ?? 0,
            probabilityOfPrecipitation: Double(chanceOfRain ?? 0) / 100.0,
            weatherCondition: condition?.text ?? "",
            weatherDescription: condition?.text ?? "",
            weatherIcon: condition?.icon.toIconURL ?? "",
            partOfDay: (isDay ?? 1) == 1 ? "d" : "n"
        )
    }
}
