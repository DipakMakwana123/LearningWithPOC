//
//  RxSwiftViewController.swift
//  InterviewPreparation
//
//  Created by Dipakbhai Valjibhai Makwana on 18/04/22.
//

import UIKit
import RxSwift
import RxCocoa

class RxSwiftViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView?
    private var viewModal: RxSwiftViewModal = RxSwiftViewModal(apiManager: APIManager())
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    private func configureViews(){
        configureTableView()
    }
    private func configureTableView1(){
       guard let tableView = self.tableView else {return}
        tableView.configure(dataSource: self,delegate: nil)
        tableView.separatorStyle = .singleLine
        tableView.registerCell(identifiers: [ListTableCell.identifier])
        
        let client = APIClient.shared
            do{
              try client.getRecipes().subscribe(
                onNext: { [weak self] result in
                    //MARK: display in UITableView

                    guard let self = self else {return}
                    self.viewModal.posts = result
                    self.reloadData()
                },
                onError: { error in
                   print(error.localizedDescription)
                },
                onCompleted: {
                   print("Completed event.")

                }).disposed(by: disposeBag)
              }
              catch{
            }

       
    }
    private func configureTableView(){
       guard let tableView = self.tableView else {return}

        tableView.separatorStyle = .singleLine
        tableView.registerCell(identifiers: [ListTableCell.identifier])
        
        let request =  APIRequest()
        let result : Observable<[countryListModel]> = self.viewModal.send(apiRequest: request)
        _ = result.bind(to: tableView.rx.items(cellIdentifier: ListTableCell.identifier,cellType: ListTableCell.self)) { ( row, model, cell) in
                cell.lblTitle?.text = model.name
            
        }
        tableView.rx.modelSelected(countryListModel.self).subscribe(onNext: { item in
                    print("SelectedItem: \(item.name)")
        }).disposed(by: disposeBag)
    }
    
    private func reloadData(){
        DispatchQueue.main.async {
            self.tableView?.reloadData()
        }
    }
}


extension RxSwiftViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModal.posts.count 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: ListTableCell.identifier, for: indexPath) as? ListTableCell,let obj = viewModal.posts[safe:indexPath.row]  else {return UITableViewCell()}
        cell.lblTitle?.text = "\(obj.getTitle())"
        cell.lblDescription?.text = "\(obj.getBody())"
        return cell
    }
}

