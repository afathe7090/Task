//
//  NetworkTarget.swift
//  Task
//
//  Created by Ahmed Fathy on 04/10/2022.
//

import Foundation
import Moya

enum NetworkServices {
    case readCityWeather(String)
    case readForecastWeather(String)
}

extension NetworkServices: TargetType {
    var baseURL: URL {
        return URL(string: Network_Constant.BASE_URL)!
    }
    
    var path: String {
        switch self {
        case .readCityWeather(_):
            return Network_Constant.WEATHER_PATH
        case .readForecastWeather(_):
            return Network_Constant.FORECAST_PATH
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    
    var task: Moya.Task {
        switch self {
        case .readCityWeather(let city):
            return .requestParameters(parameters:Network_Constant.PARAMETER(cityName: city)
                                      , encoding: URLEncoding.default)
        case .readForecastWeather(let city):
            return .requestParameters(parameters:Network_Constant.PARAMETER(cityName: city)
                                      , encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
    
    
    
}
