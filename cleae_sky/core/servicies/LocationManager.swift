//
//  LocationManager.swift
//  cleae_sky
//
//  Created by Ahmed Salah on 10/06/2026.
//

import Foundation
import CoreLocation
import Combine
import UIKit

final class LocationManager: NSObject, ObservableObject {

    @Published var authorizationStatus: CLAuthorizationStatus
    @Published var location: CLLocation?
    @Published var cityName: String?
    @Published var country: String?
    @Published var errorMessage: String?

    private let locationManager = CLLocationManager()
    private let geocoder = CLGeocoder()

    override init() {
        authorizationStatus = locationManager.authorizationStatus

        super.init()

        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }


    func requestLocationPermission() {
        locationManager.requestWhenInUseAuthorization()
    }


    func getCurrentLocation() {
        guard isAuthorized else {
            requestLocationPermission()
            return
        }

        locationManager.requestLocation()
    }


    func openSettings() {
        guard let url = URL(string: UIApplication.openSettingsURLString) else {
            return
        }

        UIApplication.shared.open(url)
    }


    var isAuthorized: Bool {
        authorizationStatus == .authorizedAlways ||
        authorizationStatus == .authorizedWhenInUse
    }

    var isDenied: Bool {
        authorizationStatus == .denied ||
        authorizationStatus == .restricted
    }

    private func fetchCityAndCountry(from location: CLLocation) {
        geocoder.reverseGeocodeLocation(location) { [weak self] placemarks, error in

            guard let self else { return }

            if let error {
                self.errorMessage = error.localizedDescription
                return
            }

            guard let placemark = placemarks?.first else {
                return
            }

            self.cityName = placemark.locality
            self.country = placemark.country
        }
    }
}


extension LocationManager: CLLocationManagerDelegate {

    func locationManagerDidChangeAuthorization(
        _ manager: CLLocationManager
    ) {
        authorizationStatus = manager.authorizationStatus

        switch manager.authorizationStatus {
        case .authorizedAlways, .authorizedWhenInUse:
            getCurrentLocation()

        case .denied, .restricted:
            errorMessage = "Location permission denied."

        case .notDetermined:
            break

        @unknown default:
            break
        }
    }

    func locationManager(
        _ manager: CLLocationManager,
        didUpdateLocations locations: [CLLocation]
    ) {
        guard let location = locations.first else {
            return
        }

        self.location = location
        fetchCityAndCountry(from: location)
    }

    func locationManager(
        _ manager: CLLocationManager,
        didFailWithError error: Error
    ) {
        errorMessage = error.localizedDescription
    }
}
