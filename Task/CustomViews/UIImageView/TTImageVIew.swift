//
//  TTImageVIew.swift
//  Task
//
//  Created by Ahmed Fathy on 02/10/2022.
//

import UIKit

class TTImageView: UIImageView {
    
    
    
    init(image: UIImage, contentMode: UIView.ContentMode = .scaleToFill ,
         tintColor: UIColor = .black , height: CGFloat? = nil , width: CGFloat? = nil){
        super.init(frame: .zero)
        self.image = image
        self.contentMode = contentMode
        self.tintColor = tintColor
        
        if let height = height {
            self.widthAnchor.constraint(equalToConstant: height).isActive = true
        }
        
        if let width = width {
            self.heightAnchor.constraint(equalToConstant: width).isActive = true
        }
    }
    
    
    required init?(coder: NSCoder) { fatalError() }
    
}
