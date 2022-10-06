//
//  WeatherVIewController.swift
//  Task
//
//  Created by Ahmed Fathy on 04/10/2022.
//

import UIKit
import Combine
import CoreLocation

class WeatherViewController: UIViewController  {
    
    
    private(set) var cancellable = Set<AnyCancellable>()
    private(set) var viewModel: WeatherViewModelProtocol!
    
    //-----------------------------------------------------------------------------------
    //=======>MARK: -  MainVIew
    //-----------------------------------------------------------------------------------
    
    private lazy var mainView: WeatherView = {
        let view = WeatherView(delegate: self)
        view.backgroundColor = .white
        return view
    }()
    
    
    //-----------------------------------------------------------------------------------
    //=======>MARK: -  Life cycle
    //-----------------------------------------------------------------------------------
    
    init(viewModel: WeatherViewModelProtocol = WeatherViewModel()){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func loadView() {
        super.loadView()
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    
}

extension WeatherViewController: WeatherViewDelegate{
    
    //-----------------------------------------------------------------------------------
    //=======>MARK: -  CollectionView
    //-----------------------------------------------------------------------------------
    func numberOfItemsInIterested() -> Int {
        return viewModel.input.cities.count
    }
    
    
    func cellOfRowAtInterested(cell: WeatherPresentedCell, indexPath: IndexPath) {
        viewModel.setupInterestedCollectionViewWeather(cell,for: indexPath)
    }

    
    func currentUserLocation(_ location: String) {
        mainView.titleForecastCitties.text = "Forecast Weather \(location)"
        viewModel.input.currentLocation.send(location)
    }
    
    //-----------------------------------------------------------------------------------
    //=======>MARK: -  Table View
    //-----------------------------------------------------------------------------------
    
    func tableViewNumberOfRows() -> Int {
        return viewModel.output.forecaset.value.count
    }
    
    func tableViewCellRowAt(_ cell: CurrentForecastCell, for indexPath: IndexPath) {
        viewModel.setupCurrentCell(cell, for: indexPath)
    }
}
