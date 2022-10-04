//
//  CountryCell.swift
//  Task
//
//  Created by Ahmed Fathy on 04/10/2022.
//

import UIKit


class CountryCell: UICollectionViewCell {
    
    private lazy var backView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.backgroundColor = #colorLiteral(red: 0.2413171944, green: 0.331065439, blue: 0.6968854924, alpha: 0.5)
        return view
    }()
    
    
    private var countryLable: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    
    
    
        
    override func awakeFromNib() {
        super.awakeFromNib()
        configureBackView()
        configureCountryName()
    }
    //-----------------------------------------------------------------------------------
    //=======>MARK: -  Heleper Functions
    //-----------------------------------------------------------------------------------
    
    
    fileprivate func configureBackView(){
        contentView.addSubview(backView)
        backView.snp.makeConstraints({
            $0.edges.equalTo(contentView.snp.edges)
        })
    }
    
    fileprivate func configureCountryName(){
        backView.addSubview(countryLable)
        countryLable.snp.makeConstraints({
            $0.top.leading.equalTo(backView).offset(20)
            $0.trailing.bottom.equalTo(backView).offset(-20)
        })
    }
    
    func setupCountryLabel(txt: String){
        self.countryLable.text = txt
    }
    
    
    func isSelectedCell(_ isSelected: Bool){
        self.backView.backgroundColor = isSelected ? #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1):#colorLiteral(red: 0.2413171944, green: 0.331065439, blue: 0.6968854924, alpha: 0.5)
    }
}
