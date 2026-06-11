# Clear Sky ⛅

A weather app built with SwiftUI. Shows the current weather for your location, a 3-day forecast with hourly details, and lets you search and save cities to check their weather anytime — with offline caching so the last forecast is always available.

## Features

- **Current weather by GPS** — temperature, condition, high/low, plus a details grid with visibility, humidity, feels-like, and pressure
- **3-day forecast** — tap any day to see the hourly breakdown
- **Hourly forecast** — "Now" plus the upcoming hours at a glance
- **City search** — search any city worldwide and save it with one tap
- **Saved locations** — tap a saved city to open its full weather screen, swipe to delete
- **Offline cache** — the last fetched weather is stored locally and shown when the network is unavailable
- **Dynamic backgrounds** — morning and evening backgrounds that follow the time of day
- **Animated splash screen** — Lottie-powered intro

## Screens

| Screen | Description |
|---|---|
| Splash | Lottie animation with app name reveal |
| Home | Current weather, details grid, and 3-day forecast for the device location |
| Forecast Details | Hourly forecast for a selected day |
| Locations | Search, save, open, and delete cities |

## Tech Stack

- **UI:** SwiftUI, NavigationStack, TabView
- **Concurrency:** async/await, structured tasks, Combine
- **Persistence:** SwiftData (weather cache + saved locations)
- **Location:** CoreLocation with permission handling and an "Open Settings" fallback
- **Networking:** URLSession with a generic, endpoint-based API client
- **Animation:** [Lottie](https://github.com/airbnb/lottie-ios) (Swift Package Manager)
- **API:** [WeatherAPI.com](https://www.weatherapi.com/)

## Architecture

The project follows Clean Architecture with MVVM in the presentation layer:

```
cleae_sky/
├── core/
│   ├── design/          # Shared UI (backgrounds)
│   ├── di/              # DIContainer — composition root
│   ├── servicies/       # API client, LocationManager
│   └── utils/           # Helpers, modifiers, API config & endpoints
├── data/
│   ├── datasource/
│   │   ├── remote/      # WeatherAPI data source
│   │   └── local/       # SwiftData data sources
│   ├── dto/             # API response models
│   ├── entity/          # SwiftData models
│   ├── mapper/          # DTO/entity → domain mappers
│   └── repository/      # Repository implementations
├── domain/
│   ├── model/           # Domain models
│   └── repository/      # Repository contracts
└── presentation/
    ├── dashboard/       # Tab bar
    ├── home/            # Home screen (view + viewmodel + components)
    ├── forecast-details/ # Hourly forecast screen
    ├── locations/       # Search & saved locations screen
    └── splash/          # Animated splash
```

**Flow:** View → ViewModel → Repository (domain contract) → Remote/Local data sources → mapped back to domain models.

- ViewModels are `@MainActor` `ObservableObject`s driving the views through published state (`idle / loading / success / failure`).
- Repositories fetch current weather and forecast concurrently (`async let`), cache the result in SwiftData, and fall back to the cache on network errors.
- All dependencies are wired in `DIContainer` and injected through initializers.

## Requirements

- Xcode 26+
- iOS 26.1+
- A free [WeatherAPI.com](https://www.weatherapi.com/) API key

## Getting Started

1. Clone the repository:
   ```bash
   git clone https://github.com/ahmed-sala/clear-sky.git
   cd clear-sky
   ```
2. Open `cleae_sky.xcodeproj` in Xcode — Swift Package dependencies (Lottie) resolve automatically.
3. Set your API key in `cleae_sky/core/utils/api/APIConfiguration.swift`:
   ```swift
   static let `default` = APIConfiguration(
       baseURL: "https://api.weatherapi.com/v1",
       apiKey: "YOUR_API_KEY",
       timeoutInterval: 30
   )
   ```
4. Build and run on a simulator or device, then allow location access when prompted.
