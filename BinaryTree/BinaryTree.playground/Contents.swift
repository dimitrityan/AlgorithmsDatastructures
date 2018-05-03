
/**
    Binary Tree
 */
indirect enum BinaryTree<T> {
    case leaf
    case node(BinaryTree<T>, T, BinaryTree<T>)
}

extension BinaryTree: CustomStringConvertible {
    public var description: String {
        switch self {
        case .node(let left, let value, let right): return "value=\(value);left=\(left.description);right=(\(right.description)"
        case .leaf: return ""
        }
    }
}

extension BinaryTree {
    /**
        Pre-order traversal
        - Parameter callback: Function that is executed with each retrieved element
    */
    public func traversePreOrder(callback: (T) -> Void) {
        if case let .node(left, value, right) = self {
            callback(value)
            left.traversePreOrder(callback: callback)
            right.traversePreOrder(callback: callback)
        }
    }
    
    /**
     In-order traversal
     In a Binary Search Tree this would retrieve the sorted data
     - Parameter callback: Function that is executed with each retrieved element
     */
    public func traverseInOrder(callback: (T) -> Void) {
        if case let .node(left, value, right) = self {
            left.traverseInOrder(callback: callback)
            callback(value)
            right.traverseInOrder(callback: callback)
        }
    }
    
    /**
     Post-order traversal
     - Parameter callback: Function that is executed with each retrieved element
     */
    public func traversePostOrder(callback: (T) -> Void) {
        if case let .node(left, value, right) = self {
            left.traversePostOrder(callback: callback)
            right.traversePostOrder(callback: callback)
            callback(value)
        }
    }
}

func callback(value: Int) {
    print(value)
}

// This is an example Binary Tree with 3 nodes
let myBinaryTree = BinaryTree<Int>.node(BinaryTree<Int>.node(.leaf , 3, .leaf), 5, BinaryTree.node(.leaf, 8, .leaf))
myBinaryTree.traversePreOrder(callback: callback)
