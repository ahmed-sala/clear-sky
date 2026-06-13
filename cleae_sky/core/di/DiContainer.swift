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

    private init(
        apiConfiguration: APIConfiguration = .default
    ) {
        self.apiConfiguration = apiConfiguration

        do {
            self.modelContainer = try ModelContainer(
                for:
                    HomeWeatherDataEntity.self,
                    SavedLocationEntity.self
            )
        } catch {
            fatalError("Failed to create ModelContainer: \(error)")
        }
    }


    private lazy var apiService: APIService =
        ApiServiceImpl(configuration: apiConfiguration)


    private lazy var weatherRemoteDataSource: WeatherRemoteDataSource =
        WeatherRemoteDataSourceImpl(apiService: apiService)

    private lazy var homeWeatherLocalDataSource: HomeWeatherLocalDataSource =
        HomeWeatherLocalDataSourceImpl(
            context: modelContainer.mainContext
        )

    private lazy var locationLocalDataSource: LocationLocalDataSource =
        LocationLocalDataSourceImpl(
            context: modelContainer.mainContext
        )


    private lazy var homeRepository: HomeRepository =
        HomeRepositoryImpl(
            remoteDataSource: weatherRemoteDataSource,
            localDataSource: homeWeatherLocalDataSource
        )

    private lazy var locationRepository: LocationRepository =
        LocationRepositoryImpl(
            remoteDataSource: weatherRemoteDataSource,
            localDataSource: locationLocalDataSource
        )


    func makeHomeViewModel() -> HomeViewModel {
        HomeViewModel(repository: homeRepository)
    }

    func makeLocationsViewModel() -> LocationsViewModel {
        LocationsViewModel(repository: locationRepository)
    }
}