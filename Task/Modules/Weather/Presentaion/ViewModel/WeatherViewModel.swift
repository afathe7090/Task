//
//  WeatherViewModel.swift
//  Task
//
//  Created by Ahmed Fathy on 04/10/2022.
//

import Foundation
import TwitterKit

protocol WeatherViewModelProtocol: AnyObject {
    var input: WeatherViewModel.Input { get }
    var output: WeatherViewModel.Output { get }
}

class WeatherViewModel: WeatherViewModelProtocol,ViewModelType {
    
    
    class Input{
        
    }
    
    class Output{
        
    }
    
    
    var input: Input = .init()
    var output: Output = .init()
    
}
