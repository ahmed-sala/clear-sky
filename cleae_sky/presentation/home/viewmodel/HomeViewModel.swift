//
//  HomeViewModel.swift
//  cleae_sky
//
//  Created by Ahmed Salah on 07/06/2026.
//

import Foundation
import Combine

@MainActor
final class HomeViewModel: ObservableObject {


    enum ViewState {
        case idle
        case loading
        case success(HomeWeatherData)
        case failure(String)
    }

    @Published private(set) var state: ViewState = .idle


    private let repository: HomeRepository


    init(repository: HomeRepository) {
        self.repository = repository
    }


    func loadWeather(lat: Double, lon: Double,
                     units: String = "metric",
                     lang: String = "en") {
        state = .loading
        Task {
            do {
                let data = try await repository.fetchHomeWeatherData(
                    lat: lat, lon: lon, units: units, lang: lang
                )
                state = .success(data)
            } catch {
                state = .failure(error.localizedDescription)
            }
        }
    }
}
