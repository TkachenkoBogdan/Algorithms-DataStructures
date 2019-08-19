//
//  Breadth-first Search.swift
//  Alg&DataStr
//
//  Created by Богдан Ткаченко on 7/8/19.
//  Copyright © 2019 Богдан Ткаченко. All rights reserved.
//

import Foundation


extension Graph where Element: Hashable {
    
    func breadthFirstSearch(from source: Vertex<Element>)
        -> [Vertex<Element>] {
            
            var queue = QueueStack<Vertex<Element>>()
            var enqueued: Set<Vertex<Element>> = []
            var visited: [Vertex<Element>] = []
            
            queue.enqueue(source)
            enqueued.insert(source)
            
            while let vertex = queue.dequeue() {
                visited.append(vertex)
                
                let neighborEdges = edges(from: vertex)
                neighborEdges.forEach {
                    edge in if !enqueued.contains(edge.destination) {
                        queue.enqueue(edge.destination)
                        enqueued.insert(edge.destination)
                    }
                }
            }
            return visited
    }
}
