//
//  DepthFirstSearch.swift
//  Alg&DataStr
//
//  Created by Богдан Ткаченко on 7/8/19.
//  Copyright © 2019 Богдан Ткаченко. All rights reserved.
//

import Foundation


extension Graph where Element: Hashable {
    func depthFirstSearch(from source: Vertex<Element>) -> [Vertex<Element>] {
        
        var stack: Stack<Vertex<Element>> = []
        var pushed: Set<Vertex<Element>> = []
        var visited: [Vertex<Element>] = []
        
        stack.push(source)
        pushed.insert(source)
        visited.append(source)
        
        outer: while let vertex = stack.peek() {
            let neighbors = edges(from: vertex)
           
            guard !neighbors.isEmpty else {
                stack.pop()
                continue
            }
            
            for edge in neighbors {
                if !pushed.contains(edge.destination) {
                    stack.push(edge.destination)
                    pushed.insert(edge.destination)
                    
                    visited.append(edge.destination)
                    continue outer
                }
            }
            stack.pop()
        }
        return visited
    }
}
