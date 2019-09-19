//: [Previous](@previous)

import Foundation
import Prelude

var str = "Hello, playground"

//: [Next](@next)

let numbers = 1...10

public func curry<A, B, C>(_ function: @escaping ((A, B)) -> C) -> (A) -> (B) -> C {
    return { (a: A) -> (B) -> C in { (b: B) -> C in function((a, b)) } }
}

func sum(x: Int, y: Int) -> Int {
    return x + y
}

func incr(x: Int) -> Int {
    print(x)
    return x + 1
}

sum(x: 5, y: 7)

let sumC = curry(sum)
let sum1 = sumC(5)
sum1(7)

let t1 = Date().timeIntervalSince1970
let n = numbers.lazy.map(incr).map(incr).map(incr).map(incr)

Array(n)
let t2 = Date().timeIntervalSince1970

print(t2 - t1)

let t3 = Date().timeIntervalSince1970
numbers.map(incr <<< incr <<< incr <<< incr)
let t4 = Date().timeIntervalSince1970

print(t4 - t3)
