//
//  SelectionSort.swift
//  Alg&DataStr
//
//  Created by Богдан Ткаченко on 7/7/19.
//  Copyright © 2019 Богдан Ткаченко. All rights reserved.
//

import Foundation

public func selectionSort<T>(_ collection: inout T)
    where T: MutableCollection, T.Element: Comparable {
        guard collection.count >= 2 else {
            return
        }
        
        for current in collection.indices {
            var lowest = current
            var other = collection.index(after: current)
            while other < collection.endIndex {
                if collection[lowest] > collection[other] {
                    lowest = other
                }
                other = collection.index(after: other)
            }
            
            if lowest != current {
                collection.swapAt(lowest, current)
            }
        
        }
        
}
