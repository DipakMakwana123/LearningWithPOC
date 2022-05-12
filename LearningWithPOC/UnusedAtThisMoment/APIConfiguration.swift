//
//  APIConfiguration.swift
//  Pargo
//
//  Created by Botree on 09/07/21.
//

import Foundation
import Alamofire



struct APIConfiguration {
   
    var endPoint : EndPoints?
    var urlString : String = ""
    var httpMethod: HTTPMethod
    var headers: HTTPHeaders?
    var parameters : [String:Any]?

    init(endPoint:EndPoints? = nil,urlString : String = "",httpMethod:Alamofire.HTTPMethod = .post,headers:HTTPHeaders? = nil ,parameters:[String:Any]? = nil ) {
      
        self.endPoint =  endPoint
        self.httpMethod = httpMethod
        self.headers = headers
        self.parameters = parameters
        self.urlString = urlString
    }    
}
extension APIConfiguration {
    
    func getRequest() -> URLRequest?{
        
        var  fullPath = ""
        if let endPoint = endPoint {
             fullPath = "\(URLs.baseURL.rawValue)\(endPoint.rawValue)"
        }
        else {
            fullPath = "\(URLs.baseURL.rawValue)\(urlString)"
        }
        guard let  url =  URL(string: fullPath )  else {return nil}
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
//        if let headers = setHeadersforLogin() {
//            request.headers = headers
//        }
       // request.addParams(params: parameters)
        return request
    }
    
    func defaultConfig() -> URLSessionConfiguration{
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30
        configuration.timeoutIntervalForResource = 30
        return configuration
    }

}

