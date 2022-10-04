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

    func textPublisher(_ textPublisher: AnyPublisher<String?, Never>)
    func didTapContinuePublisher(_ tap: AnyPublisher<Void, Never>)
}

class InterestedCountryView: UIView {
    
    
   private let tittleHint = TTLabel(text: "Should enter minimum 3 cities and max 7 cities with comma separator between them "
                                    ,numberOfLines: 0,
                             font: .systemFont(ofSize: 20, weight: .semibold), textAlignment: .center, textColor: .label)

    let nextButtonTOWeatherScreen = TTButton(text: "Countinue to weather",font: .systemFont(ofSize: 25, weight: .bold), tintColor: .white, backgroundColor: .blue, cornerRadius: 20)

    private let citiesTextFields = TTTextField(fontSiza: 19, placeholder: "Cities Name", placeholderFont: .systemFont(ofSize: 19, weight: .medium), placeholderColor: .lightGray)
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
        configureCitiesTextField()
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
    
    
    fileprivate func configureCitiesTextField(){
        addSubview(citiesTextFields)
        delegate.textPublisher(citiesTextFields.textPublisher)
        citiesTextFields.snp.makeConstraints({
            $0.top.equalTo(tittleHint.snp.bottom).offset(30)
            $0.leading.equalTo(self).offset(20)
            $0.trailing.equalTo(self).offset(-20)
        })
    }
    
  
    fileprivate func continueToWeatherScreen(){
        addSubview(nextButtonTOWeatherScreen)
        delegate.didTapContinuePublisher(nextButtonTOWeatherScreen.tapPublisher)
        nextButtonTOWeatherScreen.snp.makeConstraints({
            $0.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-15)
            $0.leading.equalTo(self.snp.leading).offset(20)
            $0.trailing.equalTo(self.snp.trailing).offset(-20)
            $0.height.equalTo(75)
        })
    }
    
    
}
