//
//  HorizontalCollectionView.swift
//  LearningWithPOC
//
//  Created by Dipakbhai Valjibhai Makwana on 05/05/22.
//

import UIKit

class HorizontalCollectionView: UICollectionView {
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: Constant.margin20, left: Constant.margin8, bottom: Constant.margin8, right: Constant.margin8)
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width / 3) - (2*Constant.margin8)  , height: 200)
        layout.scrollDirection = .horizontal
        super.init(frame: frame, collectionViewLayout: layout)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
