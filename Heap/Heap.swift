import Foundation

struct Heap<T> {
    var heap = [T]()
    var isEmpty: Bool { return heap.count <= 1 ? true : false }
    var comparer: (T, T) -> Bool

    init(_ comparer: @escaping (T,T) -> Bool) {
        self.comparer = comparer
    }
    
    mutating func push(_ element: T) {
        if heap.isEmpty {
            heap.append(element)
            heap.append(element)
            return
        }
        heap.append(element)
        
        var pushIndex = heap.count - 1

        while pushIndex > 1, comparer(heap[pushIndex], heap[pushIndex / 2]) {
            let parentIndex = pushIndex / 2
            heap.swapAt(pushIndex, parentIndex)
            pushIndex = parentIndex
        }
        
    }
    
    enum moveDownStatus { case left, right, none }
    
    mutating func pop() -> T? {
        if heap.count <= 1 { return nil }
        
        heap.swapAt(1, heap.count - 1)
        let returnData = heap.removeLast()
        
        func moveDown(_ poppedIndex: Int) -> moveDownStatus {
            let leftChildIndex = poppedIndex * 2
            let rightChildIndex = leftChildIndex + 1
            
            // 1. 모든(왼쪽) 자식 노드가 없는 경우
            if leftChildIndex >= heap.count {
                return .none
            }
            
            // 2. 왼쪽 자식 노드만 있는 경우
            if rightChildIndex >= heap.count {
                return comparer(heap[leftChildIndex], heap[poppedIndex]) ? .left : .none
            }
            
            // 3. 왼쪽, 오른쪽 자식 노드가 모두 있는 경우
            // 3-1. 자식들이 모두 자신과 정렬이 맞는 경우
            if !comparer(heap[leftChildIndex], heap[poppedIndex]) &&
                !comparer(heap[rightChildIndex], heap[poppedIndex]) {
                return .none
            }
            
            // 3-2. 자식들이 모두 자신과 정렬이 안맞는 경우 (왼쪽과 오른쪽 자식 중 정렬시킬 자식 선별)
            if comparer(heap[leftChildIndex], heap[poppedIndex]) &&
                comparer(heap[rightChildIndex], heap[poppedIndex]) {
                return comparer(heap[leftChildIndex], heap[rightChildIndex]) ? .left : .right
            }
            
            // 3-3. 왼쪽, 오른쪽 자식 중 한 자식만 자신과 정렬이 안맞는 경우
            return comparer(heap[leftChildIndex], heap[poppedIndex]) ? .left : .right
        }
        
        var poppedIndex = 1
        while true {
            switch moveDown(poppedIndex) {
            case .none:
                return returnData
            case .left:
                let leftChildIndex = poppedIndex * 2
                heap.swapAt(leftChildIndex, poppedIndex)
                poppedIndex = leftChildIndex
                
            case .right:
                let rightChildIndex = (poppedIndex * 2) + 1
                heap.swapAt(rightChildIndex, poppedIndex)
                poppedIndex = rightChildIndex
            }
        }
        
    }
    
}

var maxHeap = Heap<Int>(>) // 최대 힙
var minHeap = Heap<Int>(<) // 최소 힙
var tupleHeap = Heap<(Int, Int)> { $0.0 < $1.0 } // comparer 만 넣어주면 모든 타입 가능
