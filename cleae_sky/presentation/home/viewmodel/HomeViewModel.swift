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
    var backgroundImageName: String {
        TimeHelper.backgroundImageName()
    }
    @Published private(set) var state: ViewState = .idle
private var loadTask: Task<Void, Never>?


    private let repository: HomeRepository


    init(repository: HomeRepository) {
        self.repository = repository
    }


    func loadWeather(lat: Double, lon: Double,
                 units: String = "metric",
                 lang: String = "en") {
    loadTask?.cancel()
    state = .loading
    loadTask = Task {
        do {
            let data = try await repository.fetchHomeWeatherData(
                lat: lat, lon: lon, units: units, lang: lang
            )
            guard !Task.isCancelled else { return }
            state = .success(data)
        } catch is CancellationError {

        } catch {
            guard !Task.isCancelled else { return }
            state = .failure(error.localizedDescription)
        }
    }
}
}
