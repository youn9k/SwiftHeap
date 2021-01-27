//
//  main.swift
//  Heap
//
//  Created by 김소은 on 2021/01/27.
//

import Foundation

// 최대힙 테스트
var maxHeap = MaxHeap.init(data: 30)
maxHeap.insert(data: 20)
maxHeap.insert(data: 18)
maxHeap.insert(data: 9)
maxHeap.insert(data: 6)
maxHeap.insert(data: 50)
 
print(maxHeap)
print("pop data == \(maxHeap.pop()!)")
print(maxHeap)


// 최소힙 테스트
var minHeap = MinHeap.init(data: 30)
minHeap.insert(data: 20)
minHeap.insert(data: 18)
minHeap.insert(data: 9)
minHeap.insert(data: 6)
minHeap.insert(data: 50)
 
print(minHeap)
print("pop data == \(minHeap.pop()!)")
print(minHeap)
