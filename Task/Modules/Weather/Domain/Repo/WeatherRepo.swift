//
//  WeatherRepo.swift
//  Task
//
//  Created by Ahmed Fathy on 04/10/2022.
//

import Combine
import Moya

protocol WeatherRepo{
    func readWeatherCity(city: String)-> AnyPublisher<WeatherCity, MoyaError>
}
