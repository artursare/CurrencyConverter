//
//  SampleAPI.swift
//  Project
//
//  Created by Artūrs Āre on 02/10/2021.
//

import Foundation
import Combine
import Networking

struct RatesAPI: NetworkingService {
    private static let apiKey = "5d568348421e7b08a00fbd6a06333fbb"

    let network: NetworkingClient = {
        var client = NetworkingClient(baseURL: "http://api.exchangeratesapi.io/v1")
        client.headers["access_key"] = apiKey
        client.parameterEncoding = .json
        return client
    }()

    func getRates() -> AnyPublisher<BaseRate, Error> {
        return get("latest")
    }
}