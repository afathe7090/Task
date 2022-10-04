//
//  CompostionalFlowLayOut.swift
//  Task
//
//  Created by Ahmed Fathy on 04/10/2022.
//

import UIKit



//-----------------------------------------------------------------------------------
//=======>MARK: -  Compostional Layout
//-----------------------------------------------------------------------------------
 func customCollectionViewLayout()-> UICollectionViewCompositionalLayout{
    let layoutSize = NSCollectionLayoutSize(
        widthDimension: .estimated(125),
        heightDimension: .absolute(60)
    )

    let group = NSCollectionLayoutGroup.horizontal(
        layoutSize: .init(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: layoutSize.heightDimension
        ),
        subitems: [.init(layoutSize: layoutSize)]
    )
    group.interItemSpacing = .fixed(8)

    let section = NSCollectionLayoutSection(group: group)
    section.contentInsets = .init(top: 0, leading: 16, bottom: 0, trailing: 16)
    section.interGroupSpacing = 8

    return .init(section: section)

}
