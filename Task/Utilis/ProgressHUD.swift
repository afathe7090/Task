//
//  ProgressHUD.swift
//  Task
//
//  Created by Ahmed Fathy on 07/10/2022.
//

import UIKit

class Hud: NSObject {
    
    static var activity = UIActivityIndicatorView()
    
    class func showHud(in view: UIView){
        
        activity = UIActivityIndicatorView(frame: CGRect(x: (view.frame.width / 2) - 30, y: (view.frame.height / 2) - 30, width: 75, height: 75))
        
        activity.style = .large
        activity.backgroundColor = UIColor.lightGray.withAlphaComponent(0.7)
        activity.startAnimating()
        activity.layer.cornerRadius = 10
        view.addSubview(activity)
        
    }
    
    class func dismiss(){
        DispatchQueue.main.async {
            activity.stopAnimating()
            activity.hidesWhenStopped = true
        }
        
    }
    
}
