//
//  DIContainer.swift
//  cleae_sky
//
//  Created by Ahmed Salah on 07/06/2026.
//

import SwiftData

final class DIContainer {

    static let shared = DIContainer()

    private let apiConfiguration: APIConfiguration
    private let modelContainer: ModelContainer

    init(
        apiConfiguration: APIConfiguration = .default
    ) {
        self.apiConfiguration = apiConfiguration

        do {
            self.modelContainer = try ModelContainer(
                for: HomeWeatherDataEntity.self
            )
        } catch {
            fatalError("Failed to create ModelContainer: \(error)")
        }
    }

    private(set) lazy var apiService: APIService = {
        ApiServiceImpl(configuration: apiConfiguration)
    }()

    private(set) lazy var weatherRemoteDataSource: WeatherRemoteDataSource = {
        WeatherRemoteDataSourceImpl(apiService: apiService)
    }()

    private(set) lazy var homeWeatherLocalDataSource: HomeWeatherLocalDataSource = {
        HomeWeatherLocalDataSourceImpl(
            context: modelContainer.mainContext
        )
    }()

    private(set) lazy var homeRepository: HomeRepository = {
        HomeRepositoryImpl(
            remoteDataSource: weatherRemoteDataSource,
            localDataSource: homeWeatherLocalDataSource
        )
    }()

    func makeHomeViewModel() -> HomeViewModel {
        HomeViewModel(repository: homeRepository)
    }
}
