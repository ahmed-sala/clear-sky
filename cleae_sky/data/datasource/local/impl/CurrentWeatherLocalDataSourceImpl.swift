//
//  CurrentWeatherLocalDataSourceImpl.swift
//  cleae_sky
//
//  Created by Ahmed Salah on 07/06/2026.
//

import SwiftData

final class HomeWeatherLocalDataSourceImpl: HomeWeatherLocalDataSource {

    private let context: ModelContext

    init(context: ModelContext) {
        self.context = context
    }

    func save(_ homeData: HomeWeatherDataEntity) throws {

        let descriptor = FetchDescriptor<HomeWeatherDataEntity>()

        let cached = try context.fetch(descriptor)

        cached.forEach {
            context.delete($0)
        }

        context.insert(homeData)

        try context.save()
    }

    func getCachedHomeData() throws -> HomeWeatherDataEntity? {

        let descriptor = FetchDescriptor<HomeWeatherDataEntity>()

        return try context.fetch(descriptor).first
    }
}
