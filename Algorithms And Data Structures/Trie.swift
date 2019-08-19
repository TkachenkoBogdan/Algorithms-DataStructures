//
//  Trie.swift
//  Alg&DataStr
//
//  Created by Богдан Ткаченко on 7/6/19.
//  Copyright © 2019 Богдан Ткаченко. All rights reserved.
//

import Foundation


public class Trie<CollectionType: Collection & Hashable>
where CollectionType.Element: Hashable {
    
    public typealias Node = TrieNode<CollectionType.Element>
    
    private let root = Node(key: nil, parent: nil)
    
    public private(set) var collections: Set<CollectionType> = []
    
    public init() {}
    
    
    public func insert(_ collection: CollectionType) {
        
        var current = root
        
        for element in collection {
            if current.children[element] == nil {
                current.children[element] = Node(key: element, parent: current)
            }
            current = current.children[element]!
        }
        
        if current.isTerminating {
            return
        } else {
            current.isTerminating = true
            collections.insert(collection)
        }
    }
    
    public func remove(_ collection: CollectionType) {
        
        var current = root
        
        for element in collection {
            guard let child = current.children[element] else {
                return
            }
            current = child
        }
        
        guard current.isTerminating else {
            return
        }
        
        current.isTerminating = false
        collections.remove(collection)
        
        while let parent = current.parent,
            current.children.isEmpty && !current.isTerminating {
                
                parent.children[current.key!] = nil
                current = parent
        }
        
    }
    
    public func contains(_ collection: CollectionType) -> Bool {
        var current = root
        for element in collection {
            guard let child = current.children[element] else {
                return false
            }
            current = child
        }
        return current.isTerminating
        
    }
    
    public var count: Int {
        return self.collections.count
    }
    
    public var isEmpty : Bool {
        return self.collections.isEmpty
    }
    
    
}


public extension Trie where CollectionType: RangeReplaceableCollection {
    
    func collections(startingWith prefix: CollectionType) -> [CollectionType] {
        
        // 1
        var current = root
        
        for element in prefix {
            guard let child = current.children[element] else {
                return []
            }
            current = child
        }
        
        // 2
        return collections(startingWith: prefix, after: current)
    }
    
    private func collections(startingWith prefix: CollectionType,
                             after node: Node) -> [CollectionType] {
        // 1
        var results: [CollectionType] = []
        
        if node.isTerminating {
            results.append(prefix)
        }
        
        // 2
        for child in node.children.values {
            var prefix = prefix
            prefix.append(child.key!)
            
            print(child.key!)
            print(prefix)
            results.append(contentsOf: collections(startingWith: prefix,
                                                   after: child))
        }
        return results
    }
    
    
}
