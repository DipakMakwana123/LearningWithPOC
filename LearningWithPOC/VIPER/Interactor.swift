//
//  Interactor.swift
//  LearningWithPOC
//
//  Created by Dipakbhai Valjibhai Makwana on 25/04/22.
//

import Foundation
import Combine
// protocol
// Refrerence to presentor 

protocol EmployeeIntractorProtocol {
    var presenter: EmployeePresenterProtocol? {get set}
    func getEmployee() -> AnyPublisher<Employee,Never>?
}

class  EmployeeIntractor: EmployeeIntractorProtocol {
    var presenter: EmployeePresenterProtocol?
    func getEmployee() -> AnyPublisher<Employee,Never>?{
        guard let url = URL(string:"\(BaseURL.url)\(EndPoint.employees)") else {return nil}
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data}
            .decode(type: Employee.self, decoder: JSONDecoder())
            .replaceError(with: Employee())
            .eraseToAnyPublisher()
    }
}
