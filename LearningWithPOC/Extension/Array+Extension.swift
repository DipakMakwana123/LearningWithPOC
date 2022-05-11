//
//  Array+Extension.swift
//  Pargo
//
//  Created by Apple on 19/10/21.
//

import Foundation

extension Collection where Indices.Iterator.Element == Index {
    subscript (safe index: Index) -> Iterator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
