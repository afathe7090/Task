//
//  NetworkCases.swift
//  Task
//
//  Created by Ahmed Fathy on 04/10/2022.
//

import Foundation


enum Network_Constant{
    
    static let  BASE_URL = "https://api.openweathermap.org"
    static let  WEATHER_PATH = "/data/2.5/weather"
    static let  FORECAST_PATH = "/data/2.5/forecast"
    
    
   static func PARAMETER(cityName: String)-> [String: Any]{
        return ["q": cityName , "appid" : "b7f1d80b093cadc7f43148b44aeb0060"]
    }
}
