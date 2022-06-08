//
//  MovieCollectionCell.swift
//  LearningWithPOC
//
//  Created by Dipakbhai Valjibhai Makwana on 05/05/22.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "cell"
    
    private var lblTitle: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        label.textAlignment = .left
        
        label.text = "KGF Chapter 2"
        return label
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setUpView(){
        self.backgroundColor = .random()
        self.addSubview(lblTitle)
        
        lblTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Constant.margin4).isActive = true
        lblTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -(Constant.margin4)).isActive = true
        lblTitle.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -(Constant.margin4)).isActive = true
        
    }
}
