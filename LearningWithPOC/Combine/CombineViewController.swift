//
//  CombineViewController.swift
//  LearningWithPOC
//
//  Created by Apple on 30/03/22.
//

import UIKit
import Combine
//import SDWebImage

class CombineViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView?
    
    private let viewModal = CombineViewModal(apiManager:APIManager())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getEmployeesByCombine()
    }
    
    private func configureViews(){
        configureTableView()
    }
    private func configureTableView(){
        guard let table = self.tableView else {return}
        table.configure(dataSource: self,delegate: self)
        table.registerCell(identifiers: [ListTableCell.identifier])
    }
    
    private func reloadData(){
        DispatchQueue.main.async {
            self.tableView?.reloadData()
        }
    }
    private func getEmployeesByCombine(){
        
        guard let result = viewModal.getUsers() else {return }
        result.sink { [weak self] items in
           
            debugPrint(items)
            //self?.reloadData()
            DispatchQueue.main.async {
                if let data = items.data , data.isEmpty {
                    self?.tableView?.setEmptyMessage(ErrorMessages.noData)
                }
                else {
                    self?.viewModal.employees = items
                    self?.tableView?.restore()
                    self?.reloadData()
                }
            }
        }
        .store(in: &viewModal.cancellables)
    }
}

extension CombineViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModal.employees.data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: ListTableCell.identifier, for: indexPath) as? ListTableCell,let obj = viewModal.employees.data?[safe:indexPath.row]  else {return UITableViewCell()}
        cell.lblTitle?.text = "\(obj.name)'s salary is: \(obj.salary)"
        return cell
    }
}


extension CombineViewController: UITableViewDelegate{
    
}
