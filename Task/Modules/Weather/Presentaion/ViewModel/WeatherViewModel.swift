//
//  WeatherViewModel.swift
//  Task
//
//  Created by Ahmed Fathy on 04/10/2022.
//

import Foundation
import Combine

protocol WeatherViewModelProtocol: AnyObject {
    var input: WeatherViewModel.Input { get }
    var output: WeatherViewModel.Output { get }
    
    func fetchWeatherForecast(city: String)
    func setupInterestedCollectionViewWeather(_ cell : WeatherPresentedCell, for indexPath: IndexPath)
    func setupCurrentCell(_ cell: CurrentForecastCell, for indexPath: IndexPath)
}

class WeatherViewModel: WeatherViewModelProtocol,ViewModelType {
    
    
    class Input{
        @Published var cities: [String] = ["Egypt"]
        @Published var currentLocation: String = ""
        var weatherForcastes: [[WeatherCity]] = []
    }
    
    class Output{
        var forecaset: CurrentValueSubject<[[WeatherCity]], Never> = .init([])
    }
    
    //-----------------------------------------------------------------------------------
    //=======>MARK: -  Proberties
    //-----------------------------------------------------------------------------------
    var input: Input = .init()
    var output: Output = .init()
    private let useCase: WeatherUseCase = WeatherUseCase()
    private(set) var cancellable = Set<AnyCancellable>()
    
    
    //-----------------------------------------------------------------------------------
    //=======>MARK: -  Init
    //-----------------------------------------------------------------------------------
    
    init(cities: [String] = ["Egypt"]){
        self.input.cities = cities
    }
    
    
    //-----------------------------------------------------------------------------------
    //=======>MARK: - Interested CollectionView
    //-----------------------------------------------------------------------------------
    func setupInterestedCollectionViewWeather(_ cell : WeatherPresentedCell, for indexPath: IndexPath){
        useCase.readWeatherCity(city: input.cities[indexPath.row])
            .sink { error in
                print(error)
            } receiveValue: { weatherCity in
                cell.loadWeatherView(weatherCity)
            }.store(in: &cancellable)
    }
    
    
    
    //-----------------------------------------------------------------------------------
    //=======>MARK: -  FetchForecast Weeather
    //-----------------------------------------------------------------------------------
    func fetchWeatherForecast(city: String){
        let netwok = NetworkProviderImple()
        netwok.readForecasetWeather(city: input.currentLocation)
            .map({$0.list})
            .sink { error in
                print(error)
            } receiveValue: { forecaset in
                forecaset.publisher.map({$0}).collect(8).sink { weather in
                    self.output.forecaset.send(self.output.forecaset.value + [weather])
                }.store(in: &self.cancellable)
            }.store(in: &cancellable)
        
    }
    
    
    //-----------------------------------------------------------------------------------
    //=======>MARK: -   Set Current TableVIew
    //-----------------------------------------------------------------------------------
    func setupCurrentCell(_ cell: CurrentForecastCell, for indexPath: IndexPath) {
        output.forecaset.sink { weatherDayes in
            let dataOfCell =  weatherDayes[indexPath.row]
            cell.dateLabel.text = dataOfCell[0].dt_txt
            
            let speed = dataOfCell.map({$0.wind.speed}).reduce(0.0, {$0 + $1})
            cell.speedLabel.text = String(format: "%.2f", speed / 8)
            
            let max_temp = dataOfCell.map({$0.main.temp_max - 273.15}).reduce(0.0, {$0 + $1})
            let min_temp = dataOfCell.map({$0.main.temp_min - 273.15}).reduce(0.0, {$0 + $1})
            cell.tempLabel.text = "\(String(format: "%.2f", min_temp / 8)) \(String(format: "%.2f", max_temp / 8))"
            
            cell.descriptionWeather.text = "\(dataOfCell[0].weather[0].description)"
        }.store(in: &cancellable)
    }
    
}
