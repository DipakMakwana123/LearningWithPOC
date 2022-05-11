//
//  Router.swift
//  InterviewPreparation
//
//  Created by Dipakbhai Valjibhai Makwana on 25/04/22.
//

import Foundation


protocol AnyRouter {
    static  func start()-> AnyRouter
}


class EmployeeRouter: AnyRouter {
    
    
    static func start() -> AnyRouter {
        
        let empRouter = EmployeeRouter()
        
        var view : EmployeeViewProtocol =  ViperViewController()
        var presenter: EmployeePresenterProtocol = EmployeePresenter()
        var intractor: EmployeeIntractorProtocol = EmployeeIntractor()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interctor = intractor
        presenter.router = empRouter
        
        intractor.presenter = presenter
        
        
        return empRouter
    }
}
