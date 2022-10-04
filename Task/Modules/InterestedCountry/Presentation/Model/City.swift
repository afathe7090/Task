//
//  City.swift
//  Task
//
//  Created by Ahmed Fathy on 04/10/2022.
//

import Foundation

struct City: Codable {
    var id: Int
    var name: String
    var state: String?
    var county: String?
    var coord: CityCoord?
}

struct CityCoord: Codable{
    var lon: Double
    var lat: Double
}
