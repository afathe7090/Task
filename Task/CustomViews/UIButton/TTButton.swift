//
//  TTButton.swift
//  Task
//
//  Created by Ahmed Fathy on 02/10/2022.
//

import Foundation
import UIKit


class TTButton: UIButton  {
    
    
    init(text: String,font: UIFont = UIFont.palatino_bold, tintColor: UIColor , backgroundColor: UIColor, cornerRadius: CGFloat, borderColor: UIColor = .clear, borderWidth: CGFloat  = 0, height: CGFloat? = nil){
        super.init(frame: .zero)
        self.layer.cornerRadius = cornerRadius
        self.setAttributedTitle(NSAttributedString(string: text, attributes: [.font:font,
                                                                              .foregroundColor: tintColor]), for: .normal)

        self.backgroundColor =   backgroundColor
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
        self.clipsToBounds = true
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
