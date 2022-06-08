//
//  Table+CollectionViewController.swift
//  LearningWithPOC
//
//  Created by Dipakbhai Valjibhai Makwana on 11/04/22.
//

import UIKit

class TableCollectionViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        
    }
    private func configureViews(){
        configureTableView()
    }
    private func configureTableView(){
        guard let _ = self.tableView else {return}
       // tableView.configure(dataSource: self, delegate: self)
        
    }
}

extension TableCollectionViewController: UITableViewDelegate {
    
}
