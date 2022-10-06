//
//  WeatherView.swift
//  Task
//
//  Created by Ahmed Fathy on 05/10/2022.
//

import Foundation
import UIKit

protocol WeatherViewDelegate: AnyObject{
    
}

class WeatherView: UIView {
    
    private weak var delegate: WeatherViewDelegate!
    
    
    init(delegate: WeatherViewDelegate) {
        super.init(frame: .zero)
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
}
