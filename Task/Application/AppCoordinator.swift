//
//  AppCoordinator.swift
//  Task
//
//  Created by Ahmed Fathy on 03/10/2022.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    
    private(set) var childCoordinator: [Coordinator] = []
    private var rootNavigationController: UINavigationController = UINavigationController()
    
    var window: UIWindow?
    
    init(window: UIWindow){
        self.window = window
    }
    
    
    func start() {
        let twitterLoginCoordinator = TwitterLoginCoordinator(navigationControler: rootNavigationController)
        twitterLoginCoordinator.start()
        window?.rootViewController = rootNavigationController
        window?.makeKeyAndVisible()
    }
    
}
