//
//  TTLabel.swift
//  Task
//
//  Created by Ahmed Fathy on 02/10/2022.
//

import UIKit

class TTLabel: UILabel {
    
    init(text: String,
         font: UIFont = .systemFont(ofSize: 17),
         textAlignment: NSTextAlignment = .left , textColor: UIColor = .label){
        super.init(frame: .zero)
        
        self.text = text
        self.font = font
        self.textAlignment = textAlignment
        self.textColor = textColor
    }
    
    
    required init?(coder: NSCoder) { fatalError() }
    
    
}
