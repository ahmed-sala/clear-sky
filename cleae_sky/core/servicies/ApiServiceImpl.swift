//
//  ApiServiceImpl.swift
//  cleae_sky
//
//  Created by Ahmed Salah on 07/06/2026.
//

import Foundation

final class ApiServiceImpl: APIService {

    private let configuration: APIConfiguration
    private let session: URLSession
    private let decoder: JSONDecoder

    init(configuration: APIConfiguration = .default,
         session: URLSession = .shared) {
        self.configuration = configuration

        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest  = configuration.timeoutInterval
        sessionConfig.timeoutIntervalForResource = configuration.timeoutInterval * 2
        self.session = URLSession(configuration: sessionConfig)

        self.decoder = JSONDecoder()
        self.decoder.keyDecodingStrategy = .convertFromSnakeCase
    }

    func request<T: Decodable>(_ endpoint: APIEndpoint) async throws -> T {
        let urlRequest = try buildRequest(for: endpoint)

        let (data, response): (Data, URLResponse)
        do {
            (data, response) = try await session.data(for: urlRequest)
        } catch let urlError as URLError {
            if urlError.code == .notConnectedToInternet ||
               urlError.code == .networkConnectionLost {
                throw APIError.networkUnavailable
            }
            throw APIError.unknown(urlError)
        }

        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError.noData
        }

        guard (200...299).contains(httpResponse.statusCode) else {
            let message = String(data: data, encoding: .utf8)
            throw APIError.serverError(statusCode: httpResponse.statusCode,
                                       message: message)
        }

        guard !data.isEmpty else {
            throw APIError.noData
        }

        do {
            return try decoder.decode(T.self, from: data)
        } catch {
            throw APIError.decodingFailed(error)
        }
    }

    private func buildRequest(for endpoint: APIEndpoint) throws -> URLRequest {
        guard var components = URLComponents(string: configuration.baseURL + endpoint.path) else {
            throw APIError.invalidURL
        }

        var queryItems = endpoint.queryParameters.map {
            URLQueryItem(name: $0.key, value: $0.value)
        }
        queryItems.append(URLQueryItem(name: "key", value: configuration.apiKey))
        components.queryItems = queryItems

        guard let url = components.url else {
            throw APIError.invalidURL
        }

        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        return request
    }
}
