//
//  WeatherRepoImplementation.swift
//  Task
//
//  Created by Ahmed Fathy on 04/10/2022.
//

import Combine
import Moya


class WeatherRepoImplementation: WeatherRepo {
    
    private let network: NetworkProviderRepo = NetworkProviderImple()
    
    func readWeatherCity(city: String) -> AnyPublisher<WeatherCity, MoyaError> {
        return network.readWeatherCity(city: city)
    }
}
