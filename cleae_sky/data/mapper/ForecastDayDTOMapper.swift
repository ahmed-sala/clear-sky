extension ForecastDayDTO {

    func toDomain() -> ForecastDetails {

        ForecastDetails(
            selectedDay: date ?? "",
            hourlyForecasts: (hour ?? []).map {

                HourlyForecast(
                    time: $0.time ?? "",
                    temperature: $0.tempC ?? 0,
                    weatherIcon: $0.condition?.icon ?? ""
                )
            }
        )
    }
}
