import Foundation

public protocol Queue {
    associatedtype Element
    
    mutating func enqueue(_ element: Element) -> Bool
    mutating func dequeue() -> Element?
    
    var isEmpty: Bool { get }
    var peek: Element? { get }
    
}

// MARK: - Concerete Implementations:

// QueueArray:
public struct QueueArray<T>: Queue {

    private var array: [T] = []
    public init() {}
    
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var peek: T? {
        return array.first
    }
    
    public mutating func enqueue(_ element: T) -> Bool {
        array.append(element)
        return true
    }
    
    public mutating func dequeue() -> T? {
        return isEmpty ? nil : array.removeFirst()
    }
    
}

extension QueueArray: CustomStringConvertible {
    public var description: String {
        return String(describing: array)
    }
}



// QueueLinkedList:

public class QueueLinkedList<T>: Queue {
   
    private var list = DoublyLinkedList<T>()
    public init() {}
    
    public func enqueue(_ element: T) -> Bool {
        list.insert(atBack: element)
        return true
    }
    
    public func dequeue() -> T? {
        guard !list.isEmpty, let _ = list.front else {
            return nil
        }
        return list.removeAtFront()
    }
    
    
    public var peek: T? {
        return list.front
    }
    
    public var isEmpty: Bool {
        return list.isEmpty
    }
}


extension QueueLinkedList: CustomStringConvertible {
    public var description: String {
        return String(describing: list.compactMap( {$0}))
    }
}


public struct QueueRingBuffer<T>: Queue {
    
    private var ringBuffer: RingBuffer<T>
    
    public init(count: Int) {
        ringBuffer = RingBuffer<T>(count: count)
    }
    
    // ----------------------------------------------- //
    
    public mutating func enqueue(_ element: T) -> Bool {
        return ringBuffer.write(element)
    }
    
    public mutating func dequeue() -> T? {
        return isEmpty ? nil : ringBuffer.read()
    }
    
    
    
    public var isEmpty: Bool {
        return ringBuffer.isEmpty
    }
    
    public var peek: T? {
        return ringBuffer.first()
    }
}

extension QueueRingBuffer: CustomStringConvertible {
    public var description: String {
        return String(describing: ringBuffer)
    }
}
