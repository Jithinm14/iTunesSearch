//
//  NetworkService.swift
//  AirBnbAssignment
//
//  Created by Jithin M on 28/08/20.
//  Copyright © 2020 Jithin M. All rights reserved.
//

import Foundation
import Combine

enum NetworkError : LocalizedError {
    case userOffline
    case serverError
    case hostNotFound
    case unknownError
    case invalidUrl
}

class NetworkService {
    
    func fetchFromNetwork(resource: URL) -> AnyPublisher<[Album], Error> {
        
        print(resource.path)
                
        return URLSession.shared.dataTaskPublisher(for: resource)
            .retry(2)
            .receive(on: RunLoop.main)
            .map {
                $0.data
            }.print()
            .decode(type: Response.self, decoder: JSONDecoder())
        .map{ $0.results }.print()
            .mapError({ error -> NetworkError in
                switch error {
                case URLError.notConnectedToInternet:
                return .userOffline
                case URLError.cannotFindHost:
                return .hostNotFound
                case URLError.badURL:
                return .invalidUrl
                case URLError.badServerResponse:
                return .serverError
                default:
                return .unknownError
                }
            })
            .eraseToAnyPublisher()
    }
}
