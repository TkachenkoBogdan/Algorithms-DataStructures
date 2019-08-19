//
//  HeapSort.swift
//  Alg&DataStr
//
//  Created by Богдан Ткаченко on 7/7/19.
//  Copyright © 2019 Богдан Ткаченко. All rights reserved.
//

import Foundation


extension Heap {
    
    func sorted() -> [Element] {
        var heap = Heap(sort: sort, elements: elements)
        for index in heap.elements.indices.reversed() {
            heap.elements.swapAt(0, index)
            heap.siftDown(from: 0, upTo: index)
        }
        return heap.elements
    }
        
}
