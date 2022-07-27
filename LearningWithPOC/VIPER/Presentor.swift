//
//  Presentor.swift
//  LearningWithPOC
//
//  Created by Dipakbhai Valjibhai Makwana on 25/04/22.
//

import Foundation
import Combine

// Protocol
// Refrence to Interactor, Router , View



protocol EmployeePresenterProtocol {
    
    var router: AnyRouter? {get set}
    var interctor: EmployeeIntractorProtocol? {get set}
    var view: EmployeeViewProtocol? { get set }
    func getEmployee()
}

class EmployeePresenter: EmployeePresenterProtocol{
    
    var router: AnyRouter?
    var interctor: EmployeeIntractorProtocol?
    var view: EmployeeViewProtocol?
    var cancellables =  Set<AnyCancellable>()
    
    func getEmployee() {
        guard let result = interctor?.getEmployee() else {return }
        
        result.sink { [weak self] items in
            guard let strongSelf = self else {return}
            debugPrint(items)
            
            DispatchQueue.main.async {
                if let data = items.data, data.isEmpty {
                    strongSelf.view?.updateWithError(message: ErrorMessages.noData)
                }
                else {
                    strongSelf.view?.updateEmployee(employee: items)
                }
            }
        }
        .store(in: &cancellables)
    }
}


 
