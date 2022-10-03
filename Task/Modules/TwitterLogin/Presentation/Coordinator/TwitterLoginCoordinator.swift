//
//  TwitterLoginCoordinator.swift
//  Task
//
//  Created by Ahmed Fathy on 03/10/2022.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject{
    var childCoordinator: [Coordinator] { get }
    func start()
}


class TwitterLoginCoordinator : Coordinator{
    
    private(set) var childCoordinator: [Coordinator] = []
    private var navigationControler = UINavigationController()
    
    
    init(navigationControler: UINavigationController) {
        self.navigationControler = navigationControler
    }
    
    func start() {
        let twitterLoginViewController = TwitterLoginViewController()
        navigationControler.navigationBar.isHidden = true
        navigationControler.setViewControllers([twitterLoginViewController], animated: true)
    }
}
