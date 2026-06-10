//
//  LocationPermissionHelper.swift
//  cleae_sky
//
//  Created by Ahmed Salah on 10/06/2026.
//

import Foundation
import CoreLocation
import Combine
import UIKit

final class LocationPermissionHelper: NSObject, ObservableObject {


    @Published var authorizationStatus: CLAuthorizationStatus

    private let locationManager = CLLocationManager()

    override init() {
        authorizationStatus = locationManager.authorizationStatus
        super.init()

        locationManager.delegate = self
    }

    func requestLocationPermission() {
        locationManager.requestWhenInUseAuthorization()
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
}

extension LocationPermissionHelper: CLLocationManagerDelegate {

    func locationManagerDidChangeAuthorization(
        _ manager: CLLocationManager
    ) {
        authorizationStatus = manager.authorizationStatus
    }
}
