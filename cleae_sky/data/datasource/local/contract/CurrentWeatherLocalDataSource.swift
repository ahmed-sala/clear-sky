//
//  CurrentWeatherLocalDataSource.swift
//  cleae_sky
//
//  Created by Ahmed Salah on 07/06/2026.
//

protocol HomeWeatherLocalDataSource {

    func save(_ homeData: HomeWeatherDataEntity) throws

    func getCachedHomeData() throws -> HomeWeatherDataEntity?
}
