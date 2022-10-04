//
//  InterestedCountryView.swift
//  Task
//
//  Created by Ahmed Fathy on 03/10/2022.
//

import UIKit
import SnapKit
import Combine
import CombineCocoa

protocol InterestedCountryViewDelegate: AnyObject{
    func numberOfSections()-> Int
    func numberOfItemsInSection(section: Int) ->Int
    func cellForItemAt(_ cell: CountryCell, indexPath: IndexPath)
    func didSelectItemAt(collectionView: UICollectionView , indexPath: IndexPath)
    func didDeselectItemAt(collectionView: UICollectionView , indexPath: IndexPath)
    
    func didTapContinuePublisher(_ tap: AnyPublisher<Void, Never>)
}

class InterestedCountryView: UIView {
    
    
   private let tittleHint = TTLabel(text: "Should enter minimum 3 cities and max 7 cities",numberOfLines: 0,
                             font: .systemFont(ofSize: 20, weight: .semibold), textAlignment: .center, textColor: .label)
    

    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: customCollectionViewLayout())
        collectionView.register(UINib(nibName: "CountryCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.allowsMultipleSelection = true
        return collectionView
    }()
    
    let nextButtonTOWeatherScreen = TTButton(text: "Countinue to weather",font: .systemFont(ofSize: 25, weight: .bold), tintColor: .white, backgroundColor: .blue, cornerRadius: 20)

    
    //-----------------------------------------------------------------------------------
    //=======>MARK: -
    //-----------------------------------------------------------------------------------
    private weak var delegate: InterestedCountryViewDelegate!
    
    
    
    
    //-----------------------------------------------------------------------------------
    //=======>MARK: -  Init
    //-----------------------------------------------------------------------------------
    init(delegate: InterestedCountryViewDelegate){
        super.init(frame: .zero)
        self.delegate = delegate
        tittleHintLabel()
        configireCollectionViewLayout()
        continueToWeatherScreen()
    }
    
    
    required init?(coder: NSCoder) { fatalError() }
    
    fileprivate func tittleHintLabel(){
        addSubview(tittleHint)
        tittleHint.snp.makeConstraints({
            $0.top.equalTo(safeAreaLayoutGuide.snp.top).offset(10)
            $0.leading.equalTo(snp.leading).offset(20)
            $0.trailing.equalTo(snp.trailing).offset(-20)
        })
    }
    
    
    
    fileprivate func configireCollectionViewLayout(){
        addSubview(collectionView)
        collectionView.snp.makeConstraints({
            $0.top.equalTo(tittleHint.snp.bottom).offset(10)
            $0.leading.trailing.equalTo(self)
        })
    }
    
  
    fileprivate func continueToWeatherScreen(){
        addSubview(nextButtonTOWeatherScreen)
        delegate.didTapContinuePublisher(nextButtonTOWeatherScreen.tapPublisher)
        nextButtonTOWeatherScreen.snp.makeConstraints({
            $0.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-15)
            $0.leading.equalTo(self.snp.leading).offset(20)
            $0.trailing.equalTo(self.snp.trailing).offset(-20)
            $0.top.equalTo(collectionView.snp.bottom).offset(15)
            $0.height.equalTo(75)
        })
    }
    
    
}


extension InterestedCountryView: UICollectionViewDelegate , UICollectionViewDataSource {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        delegate.numberOfSections()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        delegate.numberOfItemsInSection(section: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CountryCell
        delegate.cellForItemAt(cell,indexPath: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate.didSelectItemAt(collectionView: collectionView, indexPath: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        delegate.didDeselectItemAt(collectionView: collectionView, indexPath: indexPath)
    }
    
}
