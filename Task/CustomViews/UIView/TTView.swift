//
//  TTView.swift
//  Task
//
//  Created by Ahmed Fathy on 02/10/2022.
//

import UIKit


class TTView: UIView  {
    
    
    init(color: UIColor , borderColor: UIColor = .clear, borderWidth: CGFloat = 0 , cornerRadius: CGFloat = 0 , height: CGFloat? = nil){
        super.init(frame: .zero)
        backgroundColor = color
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
        layer.cornerRadius = cornerRadius
        
        if let height = height  {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
}
