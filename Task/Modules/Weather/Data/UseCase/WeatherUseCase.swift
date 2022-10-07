//
//  WeatherUseCase.swift
//  Task
//
//  Created by Ahmed Fathy on 04/10/2022.
//

import Combine
import Moya

class WeatherUseCase{
    
    
    private let repo: WeatherRepo = WeatherRepoImplementation()
    
    
    func readWeatherCity(city: String) -> AnyPublisher<WeatherCity, MoyaError> {
        return repo.readWeatherCity(city: city)
    }
    
    
    func readForecasetWeather(city: String) -> AnyPublisher<ForecastCity, MoyaError> {
        return repo.readWeatherForecastCity(city: city)
    }
    
    
}
