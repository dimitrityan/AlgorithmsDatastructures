//: Playground - noun: a place where people can play

class BinarySearchTree<T: Comparable> {
    public var value: T
    public var parent: BinarySearchTree?
    public var left: BinarySearchTree?
    public var right: BinarySearchTree?
    
    init(value: T) {
        self.value = value
    }
    
    var isRoot: Bool {
        return parent == nil
    }
    
    var isLeaf: Bool {
        return left == nil && right == nil
    }
    
    var isRightChild: Bool {
        return self === parent?.right
    }
    
    var isLeftChild: Bool {
        return self === parent?.left
    }
    
    func isValidBST() -> Bool {
        if let left = self.left {
            if left.value >= value {
                return false
            }
            return left.isValidBST()
        }
        if let right = self.right {
            if right.value <= value {
                return false
            }
            return right.isValidBST()
        }
        return true
    }
    
    func max() -> BinarySearchTree {
        guard let right = self.right else {
            return self
        }
        return right.max()
    }
    
    func min() -> BinarySearchTree {
        guard let left = self.left else {
            return self
        }
        return left.min()
    }
    
    func insert(value: T) {
        // Value to insert is smaller than current node's value
        if value < self.value {
            guard let left = self.left else {
                self.left = BinarySearchTree<T>(value: value)
                self.left!.parent = self
                return
            }
            left.insert(value: value)
        }
        if value > self.value {
            guard let right = self.right else {
                self.right = BinarySearchTree<T>(value: value)
                self.right!.parent = self
                return
            }
            right.insert(value: value)
        }
    }
    
    func search(value: T) -> BinarySearchTree<T>? {
        if value < self.value {
            return left?.search(value: value)
        }
        if value > self.value {
            return right?.search(value: value)
        }
        return self
    }
    
    func remove() {
        // If a node is removed and is not a leaf replace the deleted node with
        // biggest child on the left or the smallest child on the right -> sorted tree maintained
        let replacement: BinarySearchTree?
        
        if let left = left {
            replacement = left.max()
        } else if let right = right {
            replacement = right.min()
        } else {
            replacement = nil
        }
        
        replacement?.remove()
        replacement?.right = right
        replacement?.left = left
        right?.parent = replacement
        left?.parent = replacement
        
        if let parent = parent {
            if isLeftChild {
                parent.left = replacement
            } else {
                parent.right = replacement
            }
            replacement?.parent = parent
        }
        
        parent = nil
        right = nil
        left = nil
    }
}

extension BinarySearchTree: CustomStringConvertible {
    var description: String {
        return ""
    }
    
    // Check if current is null
    // Process current node
    // Traverse left subtree (rec)
    // Traverse right subtree (rec)
    func preOrder(process: (T) -> Void) {
        process(value)
        left?.preOrder(process: process)
        right?.preOrder(process: process)
    }
    
    // Check if current is null
    // Traverse left subtree (rec)
    // Process current node
    // Traverse right subtree (rec)
    func inOrder(process: (T) -> Void) {
        left?.inOrder(process: process)
        process(value)
        right?.inOrder(process: process)
    }
    
    // Check if current is null
    // Traverse left subtree (rec)
    // Traverse right subtree (rec)
    // Process current node
    func postOrder(process: (T) -> Void) {
        left?.postOrder(process: process)
        right?.postOrder(process: process)
        process(value)
    }
}

let root = BinarySearchTree<Int>(value: 7)
root.insert(value: 2)
root.insert(value: 1)
root.insert(value: 4)
root.insert(value: 3)
root.insert(value: 5)
root.insert(value: 10)
root.insert(value: 8)
root.insert(value: 9)
root.insert(value: 12)
root.insert(value: 11)
root.insert(value: 13)
root.search(value: 10)?.remove()
root.inOrder{ value in print(value) }
root.isValidBST()
