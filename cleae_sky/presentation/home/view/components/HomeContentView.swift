//
//  HomeContentView.swift
//  cleae_sky
//
//  Created by Ahmed Salah on 11/06/2026.
//


import SwiftUI

struct HomeContentView: View {

    let state: HomeState
    let isLocationDenied: Bool
    let openSettings: () -> Void

    var body: some View {

        switch state {

        case .idle:
            if isLocationDenied {
                WeatherErrorView(
                    error: "Location permission denied.",
                    isLocationDenied: true,
                    openSettings: openSettings
                )
            } else {
                ProgressView()
                    .tint(.white)
            }

        case .loading:
            LoadingWeatherView()

        case .failure(let error):
            WeatherErrorView(
                error: error,
                isLocationDenied: isLocationDenied,
                openSettings: openSettings
            )

        case .success(let weather):
            WeatherSuccessView(weather: weather)
        }
    }
}
