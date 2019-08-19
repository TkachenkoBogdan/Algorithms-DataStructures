//
//  Vertex.swift
//  Alg&DataStr
//
//  Created by Богдан Ткаченко on 7/8/19.
//  Copyright © 2019 Богдан Ткаченко. All rights reserved.
//

import Foundation

public struct Vertex<T> {

    public let index: Int
    public let data: T
}

extension Vertex: Hashable where T: Hashable {}
extension Vertex: Equatable where T: Equatable {}

extension Vertex: CustomStringConvertible {
    public var description: String {
        return "\(index): \(data)"
    }
}
