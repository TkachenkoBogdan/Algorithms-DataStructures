import Foundation

public struct RingBuffer<T> {
    fileprivate var array: [T?]
    fileprivate var readIndex = 0
    fileprivate var writeIndex = 0
    
    public init(count: Int) {
        array = [T?](repeating: nil, count: count)
    }
    
    public mutating func write(_ element: T) -> Bool {
        if !isFull {
            array[writeIndex % array.count] = element
            writeIndex += 1
            return true
        } else {
            return false
        }
    }
    
    public mutating func read() -> T? {
        if !isEmpty {
            let element = array[readIndex % array.count]
            readIndex += 1
            return element
        } else {
            return nil
        }
    }
    
    public func first() -> T? {
        if !isEmpty {
            let element = array[readIndex % array.count]
            return element
        } else {
            return nil
        }
    }
    
    fileprivate var availableSpaceForReading: Int {
        return writeIndex - readIndex
    }
    
    public var isEmpty: Bool {
        return availableSpaceForReading == 0
    }
    
    fileprivate var availableSpaceForWriting: Int {
        return array.count - availableSpaceForReading
    }
    
    public var isFull: Bool {
        return availableSpaceForWriting == 0
    }
}
