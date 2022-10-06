//
//  NetworkCases.swift
//  Task
//
//  Created by Ahmed Fathy on 04/10/2022.
//

import Foundation


enum Network_Constant: String{
    
    case BASE_URL = "https://api.openweathermap.org/data/2.5/"
    case WEATHER_PATH = "weather"
    case FORECAST_PATH = "forecast"
    
    
    func PARAMETER(cityName: String)-> [String: Any]{
        return ["q": cityName , "appid" : "b7f1d80b093cadc7f43148b44aeb0060"]
    }
}
