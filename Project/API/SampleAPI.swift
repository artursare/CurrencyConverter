//
//  SampleAPI.swift
//  Project
//
//  Created by Artūrs Āre on 02/10/2021.
//

import Foundation
import Combine
import Networking

struct SampleAPI: NetworkingService {
    private static let apiKey = ""

    let network: NetworkingClient = {
        var client = NetworkingClient(baseURL: "https://api.com/api")
        client.headers["x-api-key"] = apiKey
        client.parameterEncoding = .json
        return client
    }()

    func validate(data: Data) -> AnyPublisher<Document, Error> {
        let document = data.base64EncodedString()

        return post("/validate", params: ["document" : document])
    }
}
