//
//  InterestedCityCell.swift
//  Task
//
//  Created by Ahmed Fathy on 06/10/2022.
//

import UIKit

class WeatherPresentedCell: UICollectionViewCell {

    static let cellID = "WeatherPresentedCell"

    @IBOutlet weak var backView: UIView!{didSet{
        backView.layer.cornerRadius = 15
    }}
    @IBOutlet weak var descriptionWeatherLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func loadWeatherView(_ weather: WeatherCity){
        cityNameLabel.text = weather.name
        descriptionWeatherLabel.text = weather.weather[0].description
        tempLabel.text = "min \(Int(weather.main.temp_min - 273.15))C    max \(Int(weather.main.temp_max - 273.15))C "
        windSpeedLabel.text = "Wind Speed: \(weather.wind.speed)"
    }
    
    
}
