//
//  TableCollectionViewController.swift
//  LearningWithPOC
//
//  Created by Dipakbhai Valjibhai Makwana on 05/05/22.
//

import UIKit

class TableCollectionViewControllerViaCode: UIViewController {
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: MyTableViewCell.identifier)
        return tableView
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Design Via Code"
        configureView()
        
    }
    
    private func configureView(){
        configureTableView()
    }
    
    private func configureTableView(){
        self.view.addSubview(tableView)
        tableView.configure(dataSource: self, delegate: self)
        tableView.configureView(superView: view)
    }
    
}
extension TableCollectionViewControllerViaCode: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(section + 1)"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier, for: indexPath) as? MyTableViewCell else {return MyTableViewCell()}
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
extension TableCollectionViewControllerViaCode: UITableViewDelegate {
    
}

class MyTableViewCell: UITableViewCell {
    
    static let identifier = "cell"
    
    private var collectionView: HorizontalCollectionView = {
        let collectionView = HorizontalCollectionView()
        collectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpView(){
        connfigureCollectionView()
    }
    
    private func connfigureCollectionView(){
        
        self.contentView.addSubview(collectionView)
        collectionView.configureView(superView: self.contentView)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
}



extension MyTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath) as? MovieCollectionViewCell else {return MovieCollectionViewCell()}
        
        return cell
    }
    
    
}
extension MyTableViewCell: UICollectionViewDelegate {
    
}


