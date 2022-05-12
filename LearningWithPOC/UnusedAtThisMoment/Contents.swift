//
//  Contents.swift
//  Pargo
//
//  Created by Apple on 04/08/21.
//

import UIKit
import SwiftUI

struct ContentList: Codable , Identifiable {
    //var id: ObjectIdentifier
    
  
    let id =  UUID()
    let contents: [Content]
    let records : Int = 0     
    enum CodingKeys: String, CodingKey {
        case contents = "contents"
    }
}

struct ContentDetail: Codable {
  
    let content: Content?
    
//    enum CodingKeys: String, CodingKey {     //   case type
//
//        case content = "content"
//    }
}

// MARK: - Attributes
struct Content: Codable , Identifiable {
    let id =  UUID()
    let contentId: String?
    let type: String?
    let attributes: ContentAttribute?
}

// MARK: - Attributes
struct ContentAttribute: Codable {
    
    let title,coverURL : String?
    let fileType:String?
    let name:String?
    let body:String?
    let profileImage: String?
    let likesCnt:Int?
    let commentsCnt:Int?
    let viewsCnt: Int?
    let videoPath:String?
    let url:String?
    let duration: String?
    let date: String?
    let genre: Genres?
    let liked:Bool?
    let userId : Int?
  //  let host:Host?
   // let roles:[Role]?
    
    
    enum CodingKeys: String, CodingKey {
         case title,body,name,genre,duration,liked,url//host
         case profileImage = "user_profile_img_path"
         case likesCnt = "total_likes"
         case commentsCnt = "total_comments"
         case viewsCnt = "total_visits"
         case videoPath = "posts_path"
         case coverURL = "cover_img_path"
         case date = "created_at"
         case userId = "user_id"
         case fileType = "file_type"
       //  case roles = "user_roles"
     }
    
}

struct Genres: Codable {
    let id: Int?
    let name: String?
}

