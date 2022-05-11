//
//  HomeViewModal.swift
//  Pargo_SwiftUI
//
//  Created by Apple on 11/01/22.
//

import Foundation
import Combine

class HomeAPIManager : ObservableObject{
    
}
class HomeViewModal : ObservableObject {
    
    var apiManager = APIManager()
//    func getData(completion: @escaping ([Meme]) -> ()){
//        //combineDemo()
//        let urlString = "https://api.imgflip.com/get_memes"
//        let serverConfig = APIConfiguration(urlString:  urlString, httpMethod: .get)
//        apiManager.apiCallWithToken(configuration: serverConfig, completion: {(success,data,response,error) in
//            guard let jsonData = data else {return}
//                let memes =  jsonData.getModal(modal: RootMeme.self)
//                completion(memes?.data.memes ?? [])
//        })
//    }
    
    func getData1() -> AnyPublisher<[RootMeme],Never>? {
        let urlString = "https://api.imgflip.com/get_memes"
        guard let url = URL(string: urlString) else {
            return nil
        }
        let publisher = URLSession.shared.dataTaskPublisher(for: url)
            .map({$0.data})
            .decode(type: [RootMeme].self, decoder: JSONDecoder())
            .catch({ _ in
                Just([])
            })
            .eraseToAnyPublisher()
                    
            return publisher
    }
    
//    func getData(completion: @escaping ([Meme]) -> ()){
//        //combineDemo()
//        let urlString = "https://api.imgflip.com/get_memes"
//        let serverConfig = APIConfiguration(urlString:  urlString, httpMethod: .get)
//        apiManager.apiCallWithToken(configuration: serverConfig, completion: {(success,data,response,error) in
//            guard let jsonData = data else {return}
//                let memes =  jsonData.getModal(modal: RootMeme.self)
//                completion(memes?.data.memes ?? [])
//        })
//    }
//    
    private func combineDemo(){
        
        let justPublisher = Just(addTwoNumbers(a: 1, b: 11))
        
        let justSubscribe = Subscribers.Sink<Int,Never> {compeletion in
            debugPrint("compeletion \(compeletion)")
        }receiveValue: { outputValue in
            debugPrint("receiveValue \(outputValue)")
        }
        justPublisher
            .print()
            .subscribe(justSubscribe)
        
//        let publishere = ["1","2","3"].publisher
//
//        publishere.sink(receiveCompletion: {
//            debugPrint("receiveCompletion \($0)")
//        }, receiveValue: {
//            debugPrint("receiveValue \($0)")
//        })
    }
    
    
    private func addTwoNumbers(a:Int,b:Int) -> Int {
        a + b
    }
}
