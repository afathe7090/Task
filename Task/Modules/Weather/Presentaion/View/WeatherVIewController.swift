//
//  WeatherVIewController.swift
//  Task
//
//  Created by Ahmed Fathy on 04/10/2022.
//

import UIKit
import Combine

class WeatherViewController: UIViewController  {
    
    
    private(set) var cancellable = Set<AnyCancellable>()
    
    
    //-----------------------------------------------------------------------------------
    //=======>MARK: -  MainVIew
    //-----------------------------------------------------------------------------------
    
    private lazy var mainView: WeatherView = {
        let view = WeatherView(delegate: self)
        return view
    }()
    
    
    //-----------------------------------------------------------------------------------
    //=======>MARK: -  Life cycle
    //-----------------------------------------------------------------------------------
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    
}

extension WeatherViewController: WeatherViewDelegate{
    
}
