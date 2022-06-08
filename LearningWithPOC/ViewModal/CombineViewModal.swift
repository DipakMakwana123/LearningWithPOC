//
//  CombineViewModal.swift
//  LearningWithPOC
//
//  Created by Apple on 30/03/22.
//

import Foundation
import Combine

class CombineViewModal {
    
    private let apiManager: APIManager
    
    var employees:Employee = Employee()

    init(apiManager:APIManager) {
        self.apiManager = apiManager
    }
    var cancellables = Set<AnyCancellable>()
    
    func getUsers() -> AnyPublisher<Employee,Never>?{
        
        guard let url = URL(string:"\(BaseURL.url)\(EndPoint.employees)") else {return nil}
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data}
            .decode(type: Employee.self, decoder: JSONDecoder())
            .replaceError(with: Employee())
            .eraseToAnyPublisher()
    }
}
