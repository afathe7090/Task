//
//  TwitterLoginViewController.swift
//  Task
//
//  Created by Ahmed Fathy on 01/10/2022.
//

import UIKit
import Combine
import CombineCocoa
import IQKeyboardManagerSwift

class TwitterLoginViewController: UIViewController{
    
    
    private let viewModel: TwitterLoginViewModelProtocol
        
    
    //-----------------------------------------------------------------------------------
    //=======>MARK: -  MainView
    //-----------------------------------------------------------------------------------
    
    
    private lazy var mainView: TwitterLoginView  = {
        let twitterLoginView = TwitterLoginView(delegate: self)
        return twitterLoginView
    }()
    
    
    private(set) var cancellable = Set<AnyCancellable>()
    
    //-----------------------------------------------------------------------------------
    //=======>MARK: -  Init
    //-----------------------------------------------------------------------------------
    init(viewModel: TwitterLoginViewModelProtocol = TwitterLoginViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    
    //-----------------------------------------------------------------------------------
    //=======>MARK: -  Life Cycle
    //-----------------------------------------------------------------------------------
    
    
    override func loadView() {
        super.loadView()
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("in ViewDidload")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        IQKeyboardManager.shared.enable = false
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        IQKeyboardManager.shared.enable = true
    }
    
    //-----------------------------------------------------------------------------------
    //=======>MARK: -   Helper Function
    //-----------------------------------------------------------------------------------
    
    
    
    
}


extension TwitterLoginViewController: TwitterViewDelegate {
    func didTapLoginPublisher(_ tap: AnyPublisher<Void, Never>) {
        tap.sink(receiveValue: { _ in
            let interectedViewController = InterestedCountryVIewController()
            interectedViewController.modalPresentationStyle = .fullScreen
            self.present(interectedViewController, animated: true)
        }).store(in: &cancellable)
    }
    
    
}
