//
//  ApiService.swift
//  cleae_sky
//
//  Created by Ahmed Salah on 07/06/2026.
//

protocol APIService {
    func request<T: Decodable>(_ endpoint: APIEndpoint) async throws -> T
}
