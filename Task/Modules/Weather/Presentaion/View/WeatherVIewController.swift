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
        view.backgroundColor = .systemBackground
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
        subscripation()
    }
    
    fileprivate func subscripation(){
        viewModel.input.$currentLocation.sink {[weak self] city in
            guard let self = self else { return }
            self.viewModel.fetchWeatherForecast(city: city)
        }.store(in: &cancellable)
                
        viewModel.output.forecaset.sink {[weak self] wea in
            guard let self = self else { return }
            self.mainView.tableView.reloadData()
        }.store(in: &cancellable)
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
        if (viewModel.output.forecaset.value.count) / 2 <= 5 {
            mainView.titleForecastCitties.text = "Forecast Weather \(location)"
            viewModel.input.currentLocation = location
            mainView.tableView.reloadData()
        }
        
        
    }
    
    //-----------------------------------------------------------------------------------
    //=======>MARK: -  Table View
    //-----------------------------------------------------------------------------------
    
    func tableViewNumberOfRows() -> Int {
        if (viewModel.output.forecaset.value.count) / 2 >= 5 {
            return 5
        }else{ return 0 }
    }
    
    func tableViewCellRowAt(_ cell: CurrentForecastCell, for indexPath: IndexPath) {
        viewModel.setupCurrentCell(cell, for: indexPath)
    }
}
