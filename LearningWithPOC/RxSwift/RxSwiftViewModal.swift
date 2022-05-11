//
//  RxSwiftViewModal.swift
//  InterviewPreparation
//
//  Created by Dipakbhai Valjibhai Makwana on 18/04/22.
//

import Foundation
import RxSwift


struct RxSwiftViewModal {
 
    let apiManager: APIManager
    var posts: [PostModel] = []
    
    init(apiManager:APIManager) {
        self.apiManager = apiManager
    }
    
    func send<T: Codable>(apiRequest: APIRequest) -> Observable<T> {
        return Observable<T>.create { observer in
            let request = apiRequest.request(with: apiRequest.baseURL)
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                do {
                    let model: countryModel = try JSONDecoder().decode(countryModel.self, from: data ?? Data())
                    observer.onNext( model.result as! T)
                } catch let error {
                    observer.onError(error)
                }
                observer.onCompleted()
            }
            task.resume()
            
            return Disposables.create {
                task.cancel()
            }
        }
    }
}



public enum RequestType: String {
    case GET, POST, PUT,DELETE
}

class APIRequest {
    let baseURL = URL(string: "https://api.printful.com/countries")!
    var method = RequestType.GET
    var parameters = [String: String]()
    
    func request(with baseURL: URL) -> URLRequest {
           var request = URLRequest(url: baseURL)
            request.httpMethod = method.rawValue
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            return request
    }
}
class APICalling {
    // create a method for calling api which is return a Observable
    
}

struct countryModel: Codable {
    let code: Int?
    let result: [countryListModel]?
    
    private enum CodingKeys: String, CodingKey {
        case code
        case result
    }
}
struct countryListModel: Codable {
    let code: String
    let name: String
    
    private enum CodingKeys: String, CodingKey {
        case code
        case name
    }
}

import RxSwift
import RxCocoa
//MARK: RequestObservable class
public class RequestObservable {
  private lazy var jsonDecoder = JSONDecoder()
  private var urlSession: URLSession
    
    
  public init(config:URLSessionConfiguration) {
      urlSession = URLSession(configuration:
                URLSessionConfiguration.default)
  }
//MARK: function for URLSession takes
  public func callAPI<ItemModel: Decodable>(request: URLRequest)
    -> Observable<ItemModel> {
  //MARK: creating our observable
  return Observable.create { observer in
  //MARK: create URLSession dataTask
  let task = self.urlSession.dataTask(with: request) { (data,
                response, error) in
  if let httpResponse = response as? HTTPURLResponse{
  let statusCode = httpResponse.statusCode
  do {
    let _data = data ?? Data()
    if (200...399).contains(statusCode) {
      let objs = try self.jsonDecoder.decode(ItemModel.self, from:
                          _data)
      //MARK: observer onNext event
      observer.onNext(objs)
    }
    else {
      observer.onError(error!)
    }
  } catch {
      //MARK: observer onNext event
      observer.onError(error)
     }
   }
     //MARK: observer onCompleted event
     observer.onCompleted()
   }
     task.resume()
     //MARK: return our disposable
     return Disposables.create {
       task.cancel()
     }
   }
  }
}
//MARK: extension for converting out RecipeModel to jsonObject
fileprivate extension Encodable {
  var dictionaryValue:[String: Any?]? {
      guard let data = try? JSONEncoder().encode(self),
      let dictionary = try? JSONSerialization.jsonObject(with: data,
        options: .allowFragments) as? [String: Any] else {
      return nil
    }
    return dictionary
  }
}
class APIClient {
  static var shared = APIClient()
  lazy var requestObservable = RequestObservable(config: .default)
    
    
  func getRecipes() throws -> Observable<[PostModel]> {
    var request = URLRequest(url:
          URL(string:"https://jsonplaceholder.typicode.com/posts")!)
    request.httpMethod = "GET"
    request.addValue("application/json", forHTTPHeaderField:
              "Content-Type")
    return requestObservable.callAPI(request: request)
  }
  
  func sendPost(recipeModel: PostModel) -> Observable<PostModel> {
     var request = URLRequest(url:
          URL(string:"https://jsonplaceholder.typicode.com/posts")!)
     request.httpMethod = "POST"
     request.addValue("application/json", forHTTPHeaderField:
      "Content-Type")
     let payloadData = try? JSONSerialization.data(withJSONObject:
           recipeModel.dictionaryValue!, options: [])
     request.httpBody = payloadData
     return requestObservable.callAPI(request: request)
   }
}
//MARK: PostModel
public struct PostModel: Codable {
  private var id: Int
  private var userId: Int
  private var title: String
  private var body: String
    
  init(id: Int, userId: Int, title: String, body: String) {
     self.id = id
     self.userId = userId
     self.title = title
     self.body = body
  }
  func getId() -> Int {
    return self.id
  }
  func getUserId() -> Int {
    return self.userId
  }
  func getTitle() -> String {
    return self.title
  }
  func getBody() -> String {
    return self.body
  }
}
