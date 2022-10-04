//
//  InterestedCountryVIewController.swift
//  Task
//
//  Created by Ahmed Fathy on 03/10/2022.
//

import UIKit
import Combine
import CombineCocoa

class InterestedCountryVIewController: UIViewController {
    
    
    private let viewModel: InterestedCountryViewModelProtocol
    private(set) var cancellable = Set<AnyCancellable>()
    
    private lazy var mainView: InterestedCountryView =  {
        let view = InterestedCountryView(delegate: self)
        view.backgroundColor = .systemBackground
        return view
    }()
    
    
    //-----------------------------------------------------------------------------------
    //=======>MARK: -  INit
    //-----------------------------------------------------------------------------------
    init(viewModel: InterestedCountryViewModelProtocol = InterestedCountryViewModel()){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) { fatalError()}
    
    //-----------------------------------------------------------------------------------
    //=======>MARK: -  Life Cycle
    //-----------------------------------------------------------------------------------
    
    
    override func loadView() {
        super.loadView()
        view = mainView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureEnableButton()
    }
    

    fileprivate func configureEnableButton(){
        viewModel.input.citites.map({
            return $0.count >= 3 && $0.count <= 7
        }).sink { statues in
            print(statues)
            self.mainView.nextButtonTOWeatherScreen.isEnabled = statues
        }.store(in: &cancellable)
    }
    
}


extension InterestedCountryVIewController: InterestedCountryViewDelegate {
    
    func textPublisher(_ textPublisher: AnyPublisher<String?, Never>) {
        textPublisher.sink { str in
            guard let str = str else { return }
            let array = str.split(separator: ",").map({$0.trimmingCharacters(in: .whitespaces)})
            self.viewModel.input.citites.send(array)
        }.store(in: &cancellable)
    }
    
    func didTapContinuePublisher(_ tap: AnyPublisher<Void, Never>) {
        tap.sink { _ in
            print("Taped")
        }.store(in: &cancellable)
    }
    
}
