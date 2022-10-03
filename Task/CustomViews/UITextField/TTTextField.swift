//
//  TTTextField.swift
//  Task
//
//  Created by Ahmed Fathy on 02/10/2022.
//

import UIKit

class TTTextField: UITextField {
    
    
    init(fontSiza: CGFloat,placeholder: String, placeholderFont: UIFont
         , placeholderColor: UIColor){
        super.init(frame: .zero)
        
        self.attributedPlaceholder = NSAttributedString(string: placeholder,
                                                        attributes: [.font:placeholderFont
                                                                    ,.foregroundColor: placeholderColor])
        self.font = UIFont.systemFont(ofSize: fontSiza)
        self.isUserInteractionEnabled = true
        self.layer.borderColor =  UIColor.lightGray.cgColor
        self.layer.borderWidth = 1
        
        clipsToBounds           = true
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        self.leftViewMode = .always
//        
        self.layer.cornerRadius = 8
        
    }
    
    
    required init?(coder: NSCoder) { fatalError() }
    
}
