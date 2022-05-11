//
//  CollectionView+Extension.swift
//  InterviewPreparation
//
//  Created by Apple on 01/04/22.
//

import UIKit

extension UICollectionView {
    
    func registerCell(identifiers:[String]){
        for identifier in identifiers {
            self.register(UINib(nibName: identifier, bundle: .main), forCellWithReuseIdentifier: identifier)
        }
    }
    
    func setLayout(gap:CGFloat = 2 ){
        let bothSideGap : CGFloat = 50
        let size = CGSize(width: (self.frame.size.width - 2*(bothSideGap)) , height: self.frame.size.height)
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: gap, bottom: 0, right: gap)
        layout.scrollDirection = .horizontal
        layout.itemSize = size
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        self.collectionViewLayout = layout
    }
    func setLayout1(wid:CGFloat){
        self.transform = CGAffineTransform(scaleX: -1, y: 1)
        let size = CGSize(width: wid , height: wid)
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.scrollDirection = .horizontal
        layout.itemSize = size
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        self.collectionViewLayout = layout
    }
    func horizontalLayout(){
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: Constant.margin20, left: Constant.margin8, bottom: Constant.margin8, right: Constant.margin8)
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width / 3) - (2*Constant.margin8)  , height: 200)
        layout.scrollDirection = .horizontal
        self.collectionViewLayout = layout
    }
    
}
