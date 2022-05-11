//
//  CompositionViewController.swift
//  InterviewPreparation
//
//  Created by Apple on 01/04/22.
//

import UIKit

class CompositionViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }
    private func configureViews(){
        configureCollectionView()
    }
    private func configureCollectionView(){
        guard let collectionView = collectionView else {return}
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.register(UINib(nibName: "PlayerCollectionCell", bundle: .main), forCellWithReuseIdentifier: "PlayerCollectionCell")
        
        collectionView.register(MyHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
        collectionView.collectionViewLayout = setLayout()
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    private func setLayout() -> UICollectionViewCompositionalLayout{
        
        let gap : CGFloat = 5
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/3), heightDimension: .fractionalHeight(1.0))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        item.contentInsets = NSDirectionalEdgeInsets(top: gap, leading: gap, bottom: gap, trailing: gap)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(200))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [makeHeader()]

        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
    func makeHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
            // 1
            let size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .estimated(50))
            // 2
            let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: size,
                                                                     elementKind: UICollectionView.elementKindSectionHeader,
                                                                     alignment: .top)
            return header
        }


}

extension CompositionViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlayerCollectionCell", for: indexPath) as? PlayerCollectionCell else {return UICollectionViewCell()}
        
        cell.backgroundColor = UIColor.random()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                           viewForSupplementaryElementOfKind kind: String,
                           at indexPath: IndexPath) -> UICollectionReusableView {
           print("UICollectionViewDelegateFlowLayout")
           switch kind {
           
           case UICollectionView.elementKindSectionHeader:
               guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as? MyHeader else {return UICollectionReusableView() }
           
               headerView.backgroundColor = UIColor.lightGray
       
           headerView.titleLabel.text = "Header"
               return headerView
           
           case UICollectionView.elementKindSectionFooter:
               guard let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "footer", for: indexPath) as? MyHeader else {return UICollectionReusableView()}
           
               footerView.backgroundColor = UIColor.green
               footerView.titleLabel.text = "Footer"
               return footerView
           
           default:
               assert(false, "Unexpected element kind")
           }
       }
    
    
}
extension CompositionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? PlayerCollectionCell else {return}
        cell.prepareVideo()
    }
}

//extension UIColor {
//    static func random() -> UIColor {
//        let redValue = CGFloat(drand48())
//        let greenValue = CGFloat(drand48())
//        let blueValue = CGFloat(drand48())
//            
//        let randomColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
//            
//        return randomColor
//        }
//}


class MyHeader: UICollectionReusableView {

    let titleLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.purple
    
        // Customize here
        addSubview(titleLabel)
        print("MyHeaderFooterClass")
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.sizeToFit()
        titleLabel.frame.origin = CGPoint(x: 15, y: 10)
    }
}


