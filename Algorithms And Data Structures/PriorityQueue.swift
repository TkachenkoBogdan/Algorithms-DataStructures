//
//  PriorityQueue.swift
//  Alg&DataStr
//
//  Created by Богдан Ткаченко on 7/7/19.
//  Copyright © 2019 Богдан Ткаченко. All rights reserved.
//

import Foundation

struct PriorityQueue<Element: Equatable>: Queue {
  
    private var heap: Heap<Element>
    
    init(sort: @escaping (Element, Element) -> Bool,
         elements: [Element] = []) {
        heap = Heap(sort: sort, elements: elements)
    }
    
    @discardableResult
    mutating func enqueue(_ element: Element) -> Bool {
        heap.insert(element)
        return true
    }
    
    @discardableResult
    mutating func dequeue() -> Element? {
        return heap.remove()
    }
    
    
    var isEmpty: Bool {
        return heap.isEmpty
    }
    
    var peek: Element? {
        return heap.peek()
    }
}
