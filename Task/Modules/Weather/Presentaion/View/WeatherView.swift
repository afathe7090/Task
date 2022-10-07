//
//  WeatherView.swift
//  Task
//
//  Created by Ahmed Fathy on 05/10/2022.
//

import SnapKit
import UIKit
import CoreLocation

protocol WeatherViewDelegate: AnyObject{
    func numberOfItemsInIterested()-> Int
    func cellOfRowAtInterested(cell: WeatherPresentedCell, indexPath: IndexPath)
    func currentUserLocation(_ location: String)
    
    
    func tableViewNumberOfRows()-> Int
    func tableViewCellRowAt(_ cell: CurrentForecastCell , for indexPath: IndexPath)
}

class WeatherView: UIView {
    
    private weak var delegate: WeatherViewDelegate!
    private let locationManager = CLLocationManager()
    
    private let titleInterestedCitties = TTLabel(text: "Intrested Citties", numberOfLines: 1, font: .boldSystemFont(ofSize: 30), textAlignment: .left, textColor: .label)
    
    private lazy var interestedCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
        collectionView.register(UINib(nibName: WeatherPresentedCell.cellID, bundle: nil)
                                , forCellWithReuseIdentifier: WeatherPresentedCell.cellID)
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    
    let titleForecastCitties = TTLabel(text: "Forecast Weather", numberOfLines: 1, font: .boldSystemFont(ofSize: 20), textAlignment: .left, textColor: .label)
    
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UINib(nibName: CurrentForecastCell.cellID, bundle: nil)
                           , forCellReuseIdentifier: CurrentForecastCell.cellID)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    
    init(delegate: WeatherViewDelegate) {
        super.init(frame: .zero)
        self.delegate = delegate
        locationManagerSetup()
        configureTitleINtrestedCollectionView()
        layout()
        configureInterestedCollectionView()
        configrueTitleForecastLabel()
        configureCurrentTableView()
        
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    
    //-----------------------------------------------------------------------------------
    //=======>MARK: -  Helper
    //-----------------------------------------------------------------------------------
    
    
    fileprivate func locationManagerSetup(){
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    fileprivate func layout(){
        let defaultSection = interestedCollectionView.defaultSections(scroll: .paging, axis: .horizontal) {
            .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        } groupSizeCompletion: {
            .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        }
        let layout = interestedCollectionView.compostionalFlowLayOut { section in
            return defaultSection
        }
        interestedCollectionView.setCollectionViewLayout(layout, animated: true)
    }
    
    
    fileprivate func configureTitleINtrestedCollectionView(){
        addSubview(titleInterestedCitties)
        titleInterestedCitties.snp.makeConstraints({
            $0.top.equalTo(safeAreaLayoutGuide).offset(35)
            $0.leading.equalTo(self.snp.leading).offset(10)
            $0.trailing.equalTo(self.snp.trailing).offset(-10)
        })
    }
    
    
    fileprivate func configureInterestedCollectionView(){
        addSubview(interestedCollectionView)
        interestedCollectionView.snp.makeConstraints({
            $0.top.equalTo(titleInterestedCitties.snp.bottom).offset(10)
            $0.leading.trailing.equalTo(self)
            $0.height.equalTo(UIScreen.main.bounds.height / 4)
        })
    }
    
    
    fileprivate func configrueTitleForecastLabel(){
        addSubview(titleForecastCitties)
        titleForecastCitties.snp.makeConstraints({
            $0.top.equalTo(interestedCollectionView.snp.bottom).offset(20)
            $0.leading.equalTo(self.snp.leading).offset(10)
            $0.trailing.equalTo(self.snp.trailing).offset(-10)
        })
    }
    
    
    fileprivate func configureCurrentTableView(){
        addSubview(tableView)
        tableView.snp.makeConstraints({
            $0.top.equalTo(titleForecastCitties.snp.bottom).offset(10)
            $0.leading.trailing.bottom.equalTo(safeAreaLayoutGuide)
        })
    }
    
    
}

extension WeatherView: UICollectionViewDelegate , UICollectionViewDataSource{
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        delegate.numberOfItemsInIterested()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeatherPresentedCell.cellID, for: indexPath) as! WeatherPresentedCell
        delegate.cellOfRowAtInterested(cell: cell, indexPath: indexPath)
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        interestedCollectionView.deselectItem(at: indexPath, animated: true)
    }
    
}


extension WeatherView: UITableViewDelegate , UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        delegate.tableViewNumberOfRows()
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CurrentForecastCell.cellID, for: indexPath) as! CurrentForecastCell
        delegate.tableViewCellRowAt(cell, for: indexPath)
        return cell
    }
    
    
}

extension WeatherView: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        CLGeocoder().reverseGeocodeLocation(manager.location!) { placemarks, error in
            if (error != nil){ print("error in reverseGeocode") }
            guard let placemarks = placemarks?[0], let location = placemarks.locality else { return }
            self.delegate.currentUserLocation(location)
        }
        
    }
}
