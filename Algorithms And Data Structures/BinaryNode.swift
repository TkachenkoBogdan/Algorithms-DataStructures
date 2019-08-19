//
//  BinaryNode.swift
//  Alg&DataStr
//
//  Created by Богдан Ткаченко on 7/5/19.
//  Copyright © 2019 Богдан Ткаченко. All rights reserved.
//

import Foundation

public class BinaryNode<Element> {
    
    public var value: Element
    public var leftChild: BinaryNode?
    public var rightChild: BinaryNode?
    
    public init(value: Element) {
        self.value = value
    }
    
}

    extension BinaryNode {
        
        // In-order:
        public func traverseInOrder(visit: (Element) -> Void) {
            leftChild?.traverseInOrder(visit: visit)
            visit(value)
            rightChild?.traverseInOrder(visit: visit)
        }
        
        // Pre-order:
        public func traversePreOrder(visit: (Element) -> Void) {
            visit(value)
            leftChild?.traversePreOrder(visit: visit)
            rightChild?.traversePreOrder(visit: visit)
        }
        // Post-order:
        public func traversePostOrder(visit: (Element) -> Void) {
            leftChild?.traversePostOrder(visit: visit)
            rightChild?.traversePostOrder(visit: visit)
            visit(value)
        }
    }

extension BinaryNode: CustomStringConvertible {
    
    public var description: String {
        return diagram(for: self)
    }
    
    private func diagram(for node: BinaryNode?,
                         _ top: String = "",
                         _ root: String = "",
                         _ bottom: String = "") -> String {
        guard let node = node else {
        return root + "nil\n"
        }
        
        if node.leftChild == nil && node.rightChild == nil {
            return root + "\(node.value)\n"
        }
        return diagram(for: node.rightChild, top + " ", top + "┌──", top + "│ ")
                + root + "\(node.value)\n"
                + diagram(for: node.leftChild,
                          bottom + "│ ", bottom + "└──", bottom + " ")
    }
}
