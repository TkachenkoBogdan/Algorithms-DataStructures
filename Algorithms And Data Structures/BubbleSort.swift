//
//  BubbleSort.swift
//  Alg&DataStr
//
//  Created by Богдан Ткаченко on 7/7/19.
//  Copyright © 2019 Богдан Ткаченко. All rights reserved.
//

import Foundation

public func bubbleSort<T>(_ collection: inout T)
    where T: MutableCollection, T.Element: Comparable {
        guard collection.count >= 2 else {
            return
        }
        
        for end in collection.indices.reversed() {
            var swapped = false
            var current = collection.startIndex
            
            while current < end {
                let next = collection.index(after: current)
                if collection[current] > collection[next] {
                    collection.swapAt(current, next)
                    swapped = true
                }
                current = next
            }
            
            if !swapped {
                return
            }
        }
}
