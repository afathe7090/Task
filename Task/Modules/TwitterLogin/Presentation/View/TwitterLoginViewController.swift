//
//  TwitterLoginViewController.swift
//  Task
//
//  Created by Ahmed Fathy on 01/10/2022.
//

import UIKit

class TwitterLoginViewController: UIViewController{
    
    
    private let viewModel: TwitterLoginViewModelProtocol
        
    
    //-----------------------------------------------------------------------------------
    //=======>MARK: -  MainView
    //-----------------------------------------------------------------------------------
    
    
    private lazy var mainView: TwitterLoginView  = {
        let twitterLoginView = TwitterLoginView(delegate: self)
        return twitterLoginView
    }()
    
    
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
    
    
    //-----------------------------------------------------------------------------------
    //=======>MARK: -   Helper Function
    //-----------------------------------------------------------------------------------
    
    
    
    
}


extension TwitterLoginViewController: TwitterViewDelegate {
    
}
