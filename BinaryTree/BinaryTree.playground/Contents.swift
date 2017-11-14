//: Playground - noun: a place where people can play

/* indirect enum BinaryTree<T> {
    case Node(value: T, left: BinaryTree, right: BinaryTree)
    case Leaf
}*/

class Node<T> {
    
    var value: T
    var leftChild: Node?
    var rightChild: Node?
    
    init(value: T) {
        self.value = value
    }
}

indirect enum BinaryTree<T> {
    case empty
    case node(BinaryTree<T>, T, BinaryTree<T>)
}

/*class BinaryTree<T> {
    
    var root: Node<T>?
    
    init(root: Node<T>) {
        self.root = root
    }
    
    func insert(value: T) {
        // TODO
        guard let leftChild = root?.leftChild else {
            
        }
    }
    
    func find(value: T) {
        // TODO
    }
    
    func remove(value: T) {
        // TODO
    }
    
    func minValue() -> T {
        // TODO
    }
    
    func maxValue() -> T {
        // TODO
    }
    
}*/
let rootNode = Node(value: 5)
// let binaryTree = BinTree<Int>(root: BinaryTree.Node(value: 5, left: BinaryTree.Leaf, right: BinaryTree.Leaf))

