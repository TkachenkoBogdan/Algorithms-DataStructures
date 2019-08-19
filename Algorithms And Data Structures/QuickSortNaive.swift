//
//  QuickSort.swift
//  Alg&DataStr
//
//  Created by Богдан Ткаченко on 7/8/19.
//  Copyright © 2019 Богдан Ткаченко. All rights reserved.
//

import Foundation



//Hoare’s partitioning:
//Hoare’s partitioning algorithm always chooses the ﬁrst element as the pivot.


public func partitionHoare<T: Comparable>(_ a: inout [T], low: Int, high: Int) -> Int {
    let pivot = a[low]
    var i = low - 1
    var j = high + 1
    
    while true {
        repeat { j -= 1 } while a[j] > pivot
        repeat { i += 1 } while a[i] < pivot
        
            if i < j {
                a.swapAt(i, j)
            } else {
            return j
            }
        }
    }

public func quicksortHoare<T: Comparable>(_ a: inout [T], low: Int, high: Int) {
    if low < high {
        let p = partitionHoare(&a, low: low, high: high)
        quicksortHoare(&a, low: low, high: p)
        quicksortHoare(&a, low: p + 1, high: high)
    }
}





















//Lomuto’s partitioning:
// 'a' is the array you are partitioning.
//• low and high set the range within the array you will partition.
//This range will get smaller and smaller with every recursion.

//[ values <= pivot | values > pivot | not compared yet | pivot ]
//   low       i-1       i      j-1     j      high-1     high



public func quicksortLomuto<T: Comparable>(_ a: inout [T], low: Int, high: Int) {
    if low < high {
        let pivot = partitionLomuto(&a, low: low,high: high)
        quicksortLomuto(&a, low: low, high: pivot - 1)
        quicksortLomuto(&a, low: pivot + 1, high: high)
    }
}

public func partitionLomuto<T: Comparable>(_ a: inout [T],
                                           low: Int,
                                           high: Int) -> Int {
    let pivot = a[high]
    
    var i = low
    for j in low..<high {
        if a[j] <= pivot {
            a.swapAt(i, j)
            i += 1
        }
    }
    
    a.swapAt(i, high)
    return i
}



















public func quicksortNaive<T: Comparable>(_ a: [T]) -> [T] {
    guard a.count > 1 else {
        return a
    }
    
    let pivot = a[a.count / 2]
    let less = a.filter {
        $0 < pivot
    }
    
    let equal = a.filter {
        $0 == pivot
    }
    let greater = a.filter {
        $0 > pivot
    }
    return quicksortNaive(less) + equal + quicksortNaive(greater)
        
}
