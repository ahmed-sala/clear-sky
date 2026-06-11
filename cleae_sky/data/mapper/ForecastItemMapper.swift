

import Foundation

extension HourDTO {

    func toDomain() -> ForecastItem {

        ForecastItem(
            timestamp: timeEpoch ?? 0,
            dateTime: time.map { $0 + ":00" } ?? "",
            temperature: tempC ?? 0,
            weatherIcon: condition?.icon.toIconURL ?? ""
        )
    }
}
