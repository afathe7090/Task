//
//  CompostionalFlowLayOut.swift
//  Task
//
//  Created by Ahmed Fathy on 04/10/2022.
//

import UIKit


extension UICollectionView {
    
    enum axis {
        case horizontal
        case virtical
    }
    
    func compostionalFlowLayOut(completion: @escaping(Int)-> NSCollectionLayoutSection)-> UICollectionViewCompositionalLayout{
        let layout = UICollectionViewCompositionalLayout(sectionProvider: { index , _ in
            completion(index)
        })
        return layout
    }
    
    func defaultSections(scroll: UICollectionLayoutSectionOrthogonalScrollingBehavior
                         , axis: axis
                         ,itemsOfPage: Int = 0
                         ,itemsSizeCompletion: @escaping()->NSCollectionLayoutSize
                         ,groupSizeCompletion: @escaping()->NSCollectionLayoutSize)-> NSCollectionLayoutSection{
        
        let itemSize = itemsSizeCompletion()
        let items = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = groupSizeCompletion()
        
        let group: NSCollectionLayoutGroup
        switch axis {
        case .horizontal:
            if itemsOfPage == 0 {
                group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [items])
            }else {
                group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: items, count: itemsOfPage)
            }
        case .virtical:
            group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: items, count: itemsOfPage)
        }
        
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = scroll
        return section
    }
    
    
    

    func headerForCompostionalWith(nibName: UICollectionReusableView,withID Identifier: String){
        register(UINib(nibName: String(describing: nibName), bundle: nil), forSupplementaryViewOfKind: "Header", withReuseIdentifier: Identifier)
    }
    
    func viewForSupplementaryElementOfKind<T: UICollectionReusableView>(_ cell: T ,for indexPath: IndexPath, withID Identifier: String, completion: ()-> Void)-> UICollectionReusableView{
        
        guard let view = self.dequeueReusableSupplementaryView(ofKind: "Header", withReuseIdentifier: Identifier, for: indexPath) as? T else{return UICollectionReusableView()}
        completion()
        return view
    }
    
    
}
