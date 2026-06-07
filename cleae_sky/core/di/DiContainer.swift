//
//  DIContainer.swift
//  cleae_sky
//
//  Created by Ahmed Salah on 07/06/2026.
//

import Foundation

final class DIContainer {

    static let shared = DIContainer()

    private let apiConfiguration: APIConfiguration

    init(apiConfiguration: APIConfiguration = .default) {
        self.apiConfiguration = apiConfiguration
    }


    private(set) lazy var apiService: APIService = {
        ApiServiceImpl(configuration: apiConfiguration)
    }()


    private(set) lazy var weatherRemoteDataSource: WeatherRemoteDataSource = {
        WeatherRemoteDataSourceImpl(apiService: apiService)
    }()

    // MARK: - Repositories

    private(set) lazy var homeRepository: HomeRepository = {
        HomeRepositoryImpl(remoteDataSource: weatherRemoteDataSource)
    }()


    func makeHomeViewModel() -> HomeViewModel {
        HomeViewModel(repository: homeRepository)
    }
}


