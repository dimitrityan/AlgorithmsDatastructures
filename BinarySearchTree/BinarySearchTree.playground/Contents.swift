//: Playground - noun: a place where people can play

class BinarySearchTree<T: Comparable> {
    private(set) public var value: T
    private(set) public var parent: BinarySearchTree?
    private(set) public var left: BinarySearchTree?
    private(set) public var right: BinarySearchTree?
    
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
        // Value to insert is smaller or equal to current node's value
        if value < self.value {
            guard let left = self.left else {
                self.left = BinarySearchTree<T>(value: value)
                self.left!.parent = self
                return
            }
            left.insert(value: value)
        } else {
            guard let right = self.right else {
                self.right = BinarySearchTree<T>(value: value)
                self.right?.parent = self
                return
            }
            right.insert(value: value)
        }
    }
    
    func search(value: T) -> BinarySearchTree<T>? {
        if value < self.value {
            return left?.search(value: value)
        } else if value > self.value {
            return right?.search(value: value)
        } else {
            return self
        }
    }
    
    func remove(value: T) {
        // If a node is remove and is not a leaf replace the deleted node with
        // biggest child on the left or the smallest child on the right -> sorted tree maintained
        guard let toRemove = search(value: value) else {
            // Element to remove not found
            print("Element \(value) not found!")
            return
        }
        // TODO
        guard let left = toRemove.left else {
            guard let right = toRemove.right else {
                toRemove.parent?.left = nil
            }
            if toRemove.isLeftChild {
                
            }
        }
        
        // toRemove?.parent?.left = toRemove.l
    }
    
    func minValue() -> T {
        // TODO
    }
    
    func maxValue() -> T {
        // TODO
    }
}

let root = BinarySearchTree<Int>(value: 5)
// let binaryTree = BinTree<Int>(root: BinaryTree.Node(value: 5, left: BinaryTree.Leaf, right: BinaryTree.Leaf))

