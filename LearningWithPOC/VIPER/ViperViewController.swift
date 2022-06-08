//
//  ViperViewController.swift
//  LearningWithPOC
//
//  Created by Dipakbhai Valjibhai Makwana on 25/04/22.
//

import UIKit


// protocol
// 2. Refrence to Presenter

protocol EmployeeViewProtocol {
    
    var presenter: EmployeePresenterProtocol? {get set}
    func updateEmployee(employee:Employee)
    func updateWithError(message: String)
}

class ViperViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView?
    var presenter: EmployeePresenterProtocol?
    var employee: Employee?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp(view: self)
        
        configureViews()
        presenter?.getEmployee()
        
    }
    
    private func configureViews(){
        configureTableView()
    }
    private func configureTableView(){
        guard let tableView = self.tableView else {return}
         tableView.configure(dataSource: self,delegate: nil)
         tableView.separatorStyle = .singleLine
         tableView.registerCell(identifiers: [ListTableCell.identifier])
    }
}

extension ViperViewController: EmployeeViewProtocol {
    func updateEmployee(employee: Employee) {
        DispatchQueue.main.async {
            self.employee = employee
            self.tableView?.restore()
            self.reloadData()
        }
    }
    
    func updateWithError(message: String) {
        DispatchQueue.main.async {
            self.tableView?.setEmptyMessage(message)
        }
    }
    
    func reloadData(){
        self.tableView?.reloadData()
    }
}

extension ViperViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.employee?.data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: ListTableCell.identifier, for: indexPath) as? ListTableCell, let data = employee?.data, let emp = data[safe:indexPath.row] else {return UITableViewCell() }
        cell.lblTitle?.text = emp.name
        
        return cell
    }
    
    
}
extension ViperViewController: UITableViewDelegate {
    
}

extension UIViewController {
    
    func setUp(view:EmployeeViewProtocol){
        
        let empRouter = EmployeeRouter()
        
        var view : EmployeeViewProtocol =  view
        var presenter: EmployeePresenterProtocol = EmployeePresenter()
        var intractor: EmployeeIntractorProtocol = EmployeeIntractor()
        
        view.presenter = presenter
         
        presenter.view = view
        presenter.interctor = intractor
        presenter.router = empRouter
        intractor.presenter = presenter
    }
}
