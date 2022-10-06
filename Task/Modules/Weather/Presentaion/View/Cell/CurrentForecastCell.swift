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
    
}
