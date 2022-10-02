//
//  TTStackView.swift
//  Task
//
//  Created by Ahmed Fathy on 02/10/2022.
//

import UIKit

class TTStackView: UIStackView  {
    
    init(arrangedSubView: [UIView] ,spacing: CGFloat,
         axis: NSLayoutConstraint.Axis,
         contentMode: UIView.ContentMode, alignment: UIStackView.Alignment
         , distribution: UIStackView.Distribution = .fill){
        
        super.init(frame: .zero)
        arrangedSubView.forEach({ addArrangedSubview($0)})
        self.axis = axis
        self.contentMode = contentMode
        self.spacing = spacing
        self.alignment = alignment
        self.distribution = distribution
    }
    
    required init(coder: NSCoder) {fatalError("init(coder:) has not been implemented") }
    
    
    
}
