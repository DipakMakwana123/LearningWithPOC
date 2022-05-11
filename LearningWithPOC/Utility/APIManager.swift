//
//  APIManager.swift
//  CodingStandardIOS
//
//  Created by Apple on 08/07/21.
//
import UIKit
import Alamofire
import Combine


enum APIFailureCondition: Error {
    case invalidServerResponse
    case unknownError
    
}
enum RESTClientError: Error {
    case unknown
}

class APIManager{
    
//    func getUsers<T:Codable>() -> AnyPublisher<T,Never>?{
//
//        guard let url = URL(string:"\(BaseURL.url)\(EndPoint.employees)") else {return nil}
//        return URLSession.shared.dataTaskPublisher(for: url)
//            .map { $0.data}
//            .decode(type: T.self, decoder: JSONDecoder())
//            .replaceError(with: T(from: <#Decoder#>))
//            .eraseToAnyPublisher()
//    }
    
   
    
    func getAPICall(url: URL, compilation: @escaping (Result<Data?,CustomError>) -> ()){
        URLSession.shared.dataTask(with: url, completionHandler:{ (data,response,err) in
            // here we have check for status code also
            if let _ = err, data == nil {
                compilation(.failure(.badURL))
            }else {
                compilation(.success(data))
            }
        })
        .resume()
    }
    
    func requestAPI(configuration:APIConfiguration , completion: @escaping (Bool,Data?,URLResponse?,Error?) -> ()) {
        
        if NetworkManager.isConnectedToNetwork() {
            guard let request = configuration.getRequest() else {return}
            let session = URLSession(configuration: CustomConfiguration.defaultConfig())
            session.dataTask(with: request as URLRequest) { (data, response, error) -> Void in
        
                guard error == nil else {
                    debugPrint("Error: problem calling GET \(error?.localizedDescription ?? "")")
                    completion(false, data,response,error)
                    return
                }
                
                guard let data = data else {
                    debugPrint("Error: did not receive data")
                    completion(false, data,response,error)
                    return
                }
                
                guard let response = response as? HTTPURLResponse, (200 ..< 300) ~= response.statusCode else {
                    debugPrint("Error: HTTP request failed")
                    completion(false, data,response,error)
                    return
                }
                
                completion(true, data,response,error)
                
            }.resume()
        }
        else
        {
            let error = NSError(domain:"", code: 0, userInfo:[ NSLocalizedDescriptionKey: "No internet Connection"]) as Error
            completion(true, nil,nil,error)
        }
    }
    
    func apiCall(configuration:APIConfiguration , completion: @escaping (Bool,Data?,URLResponse?,Error?) -> ()) {
        
        if NetworkManager.isConnectedToNetwork() {
            
            guard let request = configuration.getRequest() else {return}
            let session = URLSession(configuration: CustomConfiguration.defaultConfig())
            session.dataTask(with: request as URLRequest) { (data, response, error) -> Void in
                guard error == nil else {
                    debugPrint("Error: problem calling GET \(error?.localizedDescription ?? "")")
                    
                    completion(false, data, response, error)
                    return
                }
                guard let data = data else {
                    debugPrint("Error: did not receive data")
                    completion(false, data, response, error)
                    return
                }
                guard let response = response as? HTTPURLResponse, (200 ..< 300) ~= response.statusCode else {
                    debugPrint("Error: HTTP request failed")
                    completion(false, data, response, error)
                    return
                }
                
                completion(true, data,response,error)
                
            }.resume()
        }
        else {
            showAlert(title: "Demo", msg: "STR.internetConnection")
        }
    }
    
  /*  func apiCallWithToken(configuration:APIConfiguration , completion: @escaping (Bool,Data?,URLResponse?,Error?) -> ()) {
        
        if  NetworkReachabilityManager()!.isReachable{ // NetworkManager.isConnectedToNetwork()
            
            guard let request = configuration.getRequestWithToken() else {return}
            
            let session = URLSession(configuration: CustomConfiguration.defaultConfig())
            
            session.dataTask(with: request as URLRequest) { (data, response, error) -> Void in
                guard error == nil else {
                    debugPrint(error?.localizedDescription ?? "")
                    completion(false, data,response,error)
                    return
                }
                
                guard let data = data else {
                    debugPrint("Error: did not receive data")
                    completion(false, data,response,error)
                    return
                }
                
                guard let response = response as? HTTPURLResponse, (200 ..< 300) ~= response.statusCode else {
                    debugPrint("Error: HTTP request failed \(String(describing: response))")
                  //  let _ = ErrorHandler().isErrorFromResponse1(response: response)
                    completion(false, data,response,error)
                    return
                }                
                completion(true, data,response,error)
                
            }.resume()
        }
        else {
            showAlert(title: "Test", msg: "No internet connection")
        }
    }
    */
    private func showAlert(title:String,msg:String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: {_ in
            
        })
        alert.addAction(okAction)        
        DispatchQueue.main.async {
            let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
            window?.rootViewController?.present(alert, animated: true, completion: nil)
        }
    }
    
    
}

// MARK: Multipart functions
extension APIManager: ObservableObject {
    func getData(_ url:URL) async -> Future<Data?, Error> {
        let session = URLSession.shared
        return Future { promise in
            let task = session.dataTask(with: url) { data, response, error in
                if let err = error {
                    promise(.failure(err))
                } else {
                    if let data = data {
                        promise(.success(data))
                    }  else {
                        let unknownError = APIFailureCondition.invalidServerResponse
                        promise(.failure(unknownError))
                    }
                }
            }
            task.resume()
        }
    }
    
}
extension Data {
    mutating func append(_ string: String) {
        if let data = string.data(using: .utf8) {
            append(data)
        }
    }
}
class CustomConfiguration : URLSessionConfiguration {
    
    static func defaultConfig() -> URLSessionConfiguration{
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30
        configuration.timeoutIntervalForResource = 30
        return configuration
    }
}



