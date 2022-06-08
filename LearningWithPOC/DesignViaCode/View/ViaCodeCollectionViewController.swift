//
//  ViaCodeCollectionViewController.swift
//  LearningWithPOC
//
//  Created by Dipakbhai Valjibhai Makwana on 05/05/22.
//

import UIKit

class ViaCodeCollectionViewController: UIViewController {
    
    private var collectionView: HorizontalCollectionView = {
        let collectionView = HorizontalCollectionView()
        collectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    private func configureView(){
        connfigureCollectionView()
    }
    
    private func connfigureCollectionView(){

        self.view.addSubview(collectionView)
        collectionView.configureView(superView: self.view)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension ViaCodeCollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath) as? MovieCollectionViewCell else {return MovieCollectionViewCell()}
        return cell
    }
}
extension ViaCodeCollectionViewController: UICollectionViewDelegate {
    
}


