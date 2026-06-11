//
//  WeatherErrorView.swift
//  cleae_sky
//
//  Created by Ahmed Salah on 11/06/2026.
//



import SwiftUI

struct WeatherErrorView: View {

    let error: String
    let isLocationDenied: Bool
    let openSettings: () -> Void

    var body: some View {

        VStack(spacing: 16) {

            Image(systemName: "exclamationmark.triangle.fill")
                .font(.system(size: 40))

            Text(error)
                .multilineTextAlignment(.center)

            if isLocationDenied {
                Button("Open Settings") {
                    openSettings()
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .padding()
        .foregroundStyle(.white)
    }
}
