//
//  TrieNode.swift
//  Alg&DataStr
//
//  Created by Богдан Ткаченко on 7/6/19.
//  Copyright © 2019 Богдан Ткаченко. All rights reserved.
//

import Foundation

public class TrieNode<Key: Hashable> {
    
    public var key: Key?
    
    public weak var parent: TrieNode?
    
    public var children: [Key: TrieNode] = [:]
    
    public var isTerminating = false
    
    public init(key: Key?, parent: TrieNode?) {
        self.key = key
        self.parent = parent
    }
}
