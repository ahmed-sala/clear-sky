//
//  LoadingWeatherView.swift
//  cleae_sky
//
//  Created by Ahmed Salah on 11/06/2026.
//

import SwiftUI

struct LoadingWeatherView: View {

    var body: some View {
        VStack(spacing: 16) {

            ProgressView()
                .tint(.white)

            Text("Loading weather...")
                .foregroundStyle(.white)
        }
    }
}
