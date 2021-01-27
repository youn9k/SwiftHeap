//
//  main.swift
//  Heap
//
//  Created by 김소은 on 2021/01/27.
//

import Foundation

// 최대힙 테스트
var maxHeap = MaxHeap.init(30)
maxHeap.insert(20)
maxHeap.insert(18)
maxHeap.insert(9)
maxHeap.insert(6)
maxHeap.insert(50)
 
print(maxHeap)
print("pop data == \(maxHeap.pop()!)")
print(maxHeap)


// 최소힙 테스트
var minHeap = MinHeap.init(30)
minHeap.insert(20)
minHeap.insert(18)
minHeap.insert(9)
minHeap.insert(6)
minHeap.insert(50)
 
print(minHeap)
print("pop data == \(minHeap.pop()!)")
print(minHeap)
