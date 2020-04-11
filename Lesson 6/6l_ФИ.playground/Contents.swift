import UIKit

/*
 1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
 2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
 3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.
 */

class MyQueue<T> {
    var lastNode: Node<T> = Node()
    var currentNode: Node<T>?
    var size: Int = 0
    
    init() {
        self.currentNode = self.lastNode
    }
    
    subscript(index: Int) -> T? {
        var node: Node = self.currentNode!
        
        if index > self.size - 1 {
            return nil
            
        } else if index > 0 {
            for _ in 1...index {
                node = node.next!
            }
        }

        return node.value!
    }
    
    func getValue() -> T?{
        return self.currentNode!.value
    }
    
    func push(value: T) {
        let newNode: Node<T> = createNodeByValue(value: value)
        
        self.lastNode.next = newNode
        self.lastNode = newNode
        self.size += 1
    }
    
    func pop() -> T? {
        let node: Node<T> = currentNode!
        
        currentNode = currentNode!.next
        self.size -= 1
        
        return node.value
    }
    
    func filter(_ predicate: (Int) -> Bool) {
//        var tmpArray = [Int]()               // создает временный массив
//        for element in array {
//            if predicate(element) {         // вызываем замыкание, чтобы проверить элемент
//                tmpArray.append(element)
//            }
//        }
//        return tmpArray // возвращаем отфильтрованный массив
        
        var node: Node<T> = self.currentNode!
        var val: Int
        for _ in 1...self.size - 1 {
            if node.value! is Int {
                val = node.value! as! Int
                if (predicate(val)) {
                    node.value = nil
                }
            }
            
            node = node.next!
        }
    }
    
    private func createNodeByValue(value: T) -> Node<T> {
        var newNode: Node<T> = Node(value: value)

        if (size > 0) {
            newNode = Node(value: value)
        } else {
            newNode = self.lastNode
            lastNode.value = value
            
            currentNode = lastNode
        }
        
        return newNode
    }
    
    class Node<T> {
        var next: Node<T>?
        var value: T?
        
        init(value: T) {
            self.value = value
        }
        
        init(){}
    }
}

var queue: MyQueue<Int> = MyQueue()
queue.push(value: 11)
queue.push(value: 22)
queue.push(value: 33)
queue.push(value: 3)
queue.push(value: 44)
queue.push(value: 55)

let odd: (Int) -> Bool = { (element: Int) -> Bool in
    return element % 2 == 0
}

print(queue.size)
queue.filter(odd)

for _ in 1...queue.size {
    print(queue.pop())
}

queue.push(value: 66)
print(queue.getValue())
print(queue.size)


