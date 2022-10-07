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
    
    func readWeatherForecastCity(city: String) -> AnyPublisher<ForecastCity, MoyaError> {
        return network.readForecasetWeather(city: city)
    }
    
}
