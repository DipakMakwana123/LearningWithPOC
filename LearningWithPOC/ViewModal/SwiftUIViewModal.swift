//
//  SwiftUIViewModal.swift
//  LearningWithPOC
//
//  Created by Dipakbhai Valjibhai Makwana on 12/04/22.
//

import Foundation
import Combine


struct SwiftUIViewModal {
    
    private let apiManager: APIManager
    
    var employees:Employee = Employee()
    
    init(apiManager:APIManager) {
        self.apiManager = apiManager
    }
    
    func getMemesData(compilation: @escaping ([Meme]) -> ()){
        let urlString = "https://api.imgflip.com/get_memes"
        guard let url = URL(string: urlString) else {return }
        
        
        apiManager.getAPICall(url: url, compilation: {res in
            
            switch res {
            case.success(let data):
                // parsing data
                guard let response = data?.getModal(modal: RootMeme.self) else {return
                   // compilation(.failure(.parserError))
                }
                compilation(response.data.memes)
            case.failure(let err):
                debugPrint(err.localizedDescription)
                //compilation(.failure(.unknown))
            }
        })
      
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
}
