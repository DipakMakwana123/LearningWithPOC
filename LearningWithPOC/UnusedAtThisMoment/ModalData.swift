//
//  ModalData.swift
//  Pargo_SwiftUI
//
//  Created by Apple on 05/01/22.
//

import Foundation
// MARK: - Welcome
struct RootMeme: Codable,Identifiable {
    var id: UUID?
    let success: Bool
    let data: DataClass
}
// MARK: - DataClass
struct DataClass: Codable,Identifiable {
    var id: UUID?
    let memes: [Meme]
}

// MARK: - Meme
struct Meme: Codable,Identifiable, Hashable {
    let id, name: String?
    let url: String
    let width, height, boxCount: Int

    enum CodingKeys: String, CodingKey {
        case id, name, url, width, height
        case boxCount = "box_count"
    }
}
