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

    func setupInterestedCollectionViewWeather(_ cell : WeatherPresentedCell, for indexPath: IndexPath)
    func setupCurrentCell(_ cell: CurrentForecastCell, for indexPath: IndexPath)
}

class WeatherViewModel: WeatherViewModelProtocol,ViewModelType {
    
    
    class Input{
        @Published var cities: [String] = ["Egypt"]
        var currentLocation: CurrentValueSubject<String, Never> = .init("")
    }
    
    class Output{
        var forecaset: CurrentValueSubject<[WeatherCity], Never> = .init([])
    }
    
    
    var input: Input = .init()
    var output: Output = .init()
    private let useCase: WeatherUseCase = WeatherUseCase()
    private(set) var cancellable = Set<AnyCancellable>()
    
    
    
    //-----------------------------------------------------------------------------------
    //=======>MARK: -
    //-----------------------------------------------------------------------------------
    func setupInterestedCollectionViewWeather(_ cell : WeatherPresentedCell, for indexPath: IndexPath){
        useCase.readWeatherCity(city: input.cities[indexPath.row])
            .sink { error in
                print(error)
            } receiveValue: { weatherCity in
                cell.loadWeatherView(weatherCity)
            }.store(in: &cancellable)
    }
    
    
    func setupCurrentCell(_ cell: CurrentForecastCell, for indexPath: IndexPath) {
        
//        let netwok = NetworkProviderImple()
//        netwok.readForecasetWeather(city: input.currentLocation.value)
//            .sink { error in
//                print(error)
//            } receiveValue: { forecast in
//
//                forecast.list.publisher.collect(8).sink { weatherCities in
//
//                }.store(in: &self.cancellable)
//
////                forecast.list[0].dt_txt
//            }.store(in: &cancellable)

        
//        netwok.readForecasetWeather(city: input.currentLocation.value)
//            .map({ $0.list})
//            .sink { error in
//                print(error)
//            } receiveValue: { forecast in
//                forecast.publisher.collect(8).sink {
//                    let allMax =  $0.map({$0.main.temp_max - 273.15}).reduce(0.0, { ($0) + $1 })
//                    let allMin =   $0.map({$0.main.temp_min - 273.15}).reduce(0.0, { ($0) + $1 })
//
//                    let data = $0[indexPath.row]
////                    cell.tempLabel = "max \(allMax) min\(allMin)"
////                    cell.dateLabel = $0.dt_txt
//                }.store(in: &self.cancellable)
//            }.store(in: &cancellable)
    }
    
}
