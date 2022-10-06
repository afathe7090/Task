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
}

extension NetworkServices: TargetType {
    var baseURL: URL {
        return URL(string: "https://api.openweathermap.org")!
    }
    
    var path: String {
        switch self {
        case .readCityWeather(_):
            return "/data/2.5/weather"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    
    var task: Moya.Task {
        switch self {
        case .readCityWeather(let city):
            return .requestParameters(parameters: ["q" : city , "appid" : "b7f1d80b093cadc7f43148b44aeb0060"]
                                      , encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
    
    
    
}
