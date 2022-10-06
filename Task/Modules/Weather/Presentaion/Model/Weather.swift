//
//  Weather.swift
//  Task
//
//  Created by Ahmed Fathy on 04/10/2022.
//

import Foundation


struct WeatherCity: Codable {
    
    let id : Int
    let name: String
    let main: Temp
    let wind: Wind
    let weather: [Weather]
    
}

struct Weather: Codable {
    let id: Int
    let description: String
}

struct Temp: Codable{
    let temp_min: Double
    let temp_max: Double
}

struct Wind: Codable {
    let speed: Double
}
