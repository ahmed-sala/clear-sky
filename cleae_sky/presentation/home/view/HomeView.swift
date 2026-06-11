//
//  HomeView.swift
//  cleae_sky
//
//  Created by Ahmed Salah on 07/06/2026.
//


import SwiftUI
import CoreLocation
import Combine

struct HomeView: View {

    @StateObject private var viewModel: HomeViewModel
    @StateObject private var locationManager = LocationManager()

    let cityLat: Double?
    let cityLon: Double?

    init(
        viewModel: HomeViewModel,
        cityLat: Double? = nil,
        cityLon: Double? = nil
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.cityLat = cityLat
        self.cityLon = cityLon
    }

    var body: some View {
        ZStack {
            BackgroundView(
                imageName: viewModel.backgroundImageName
            )

            HomeContentView(
                state: viewModel.state,
                isLocationDenied: locationManager.isDenied,
                openSettings: {
                    locationManager.openSettings()
                }
            )
        }
        .onAppear {

            if let lat = cityLat,
               let lon = cityLon {

                viewModel.loadWeather(
                    lat: lat,
                    lon: lon
                )

            } else {

                handleInitialLocationRequest()
            }
        }
        .onReceive(locationManager.$location.compactMap { $0 }) { location in

            guard cityLat == nil else { return }

            loadWeather(for: location)
        }
    }

    private func handleInitialLocationRequest() {
        if locationManager.isAuthorized {
            locationManager.getCurrentLocation()
        } else {
            locationManager.requestLocationPermission()
        }
    }

    private func loadWeather(for location: CLLocation) {
        viewModel.loadWeather(
            lat: location.coordinate.latitude,
            lon: location.coordinate.longitude
        )
    }
}
