//
//  ForecastDetailsView.swift
//  cleae_sky
//
//  Created by Ahmed Salah on 11/06/2026.
//

import SwiftUI
struct ForecastDetailsView: View {

    init(details: ForecastDetails) {
        self.details = details

        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()

        appearance.titleTextAttributes = [
            .foregroundColor: UIColor.white
        ]

        appearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor.white
        ]

        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }

    let details: ForecastDetails

    var backgroundImageName: String {
        TimeHelper.backgroundImageName()
    }

    var body: some View {
        ZStack {
            BackgroundView(imageName: backgroundImageName)

            ScrollView(showsIndicators: false) {
                LazyVStack(spacing: 12) {
                    ForEach(Array(details.hourlyForecasts.enumerated()), id: \.offset) { index, hour in
                        HourlyForecastRow(
                            hour: hour,
                            isNow: index == 0
                        )
                    }
                }
                .padding()
            }
        }
        .navigationTitle("\(details.selectedDay) Forecast")
        .navigationBarTitleDisplayMode(.inline)
    }
}

//#Preview {
//    ForecastDetailsView()
//}
