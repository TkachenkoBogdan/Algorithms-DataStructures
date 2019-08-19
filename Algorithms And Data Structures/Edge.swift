//
//  Edge.swift
//  Alg&DataStr
//
//  Created by Богдан Ткаченко on 7/8/19.
//  Copyright © 2019 Богдан Ткаченко. All rights reserved.
//

import Foundation

public struct Edge<T> {
    public let source: Vertex<T>
    public let destination: Vertex<T>
    public let weight: Double?
}

extension Edge: Equatable where T: Equatable {}
