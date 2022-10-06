//
//  NetworkProvider.swift
//  Task
//
//  Created by Ahmed Fathy on 04/10/2022.
//

import Combine
import Moya

protocol NetworkProviderRepo {
    func readWeatherCity(city: String)-> AnyPublisher<WeatherCity, MoyaError>
}

class NetworkProviderImple:  NetworkProviderRepo{
    
    private let provider = MoyaProvider<NetworkServices>()
    
    func readWeatherCity(city: String)-> AnyPublisher<WeatherCity, MoyaError>{
      return provider
            .requestPublisher(.readCityWeather(city))
            .filterSuccessfulStatusCodes()
            .map(WeatherCity.self)
    }
    
}
