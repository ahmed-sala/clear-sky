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

    init(viewModel: HomeViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        ZStack {

            HomeBackgroundView(
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
            handleInitialLocationRequest()
        }
        .onReceive(locationManager.$location.compactMap { $0 }) { location in
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
