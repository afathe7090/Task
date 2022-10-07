//
//  CurrentForecastCell.swift
//  Task
//
//  Created by Ahmed Fathy on 06/10/2022.
//

import UIKit

class CurrentForecastCell: UITableViewCell {

    
    static let cellID = "CurrentForecastCell"
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionWeather: UILabel!
    
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setCell(_ dataOfCell: [WeatherCity]){
       dateLabel.text = dataOfCell[0].dt_txt
        
        let speed = dataOfCell.map({$0.wind.speed}).reduce(0.0, {$0 + $1})
        speedLabel.text = String(format: "%.2f", speed / 8)
        
        let max_temp = dataOfCell.map({$0.main.temp_max - 273.15}).reduce(0.0, {$0 + $1})
        let min_temp = dataOfCell.map({$0.main.temp_min - 273.15}).reduce(0.0, {$0 + $1})
        tempLabel.text = "\(String(format: "%.2f", min_temp / 8)) \(String(format: "%.2f", max_temp / 8))"
        
        descriptionWeather.text = "\(dataOfCell[0].weather[0].description)"
    }
    
}
