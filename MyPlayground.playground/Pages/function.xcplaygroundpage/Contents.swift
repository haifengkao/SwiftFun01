import UIKit
import Prelude
var str = "Hello, playground"


func square (x: Int) -> Int {
    return x * x
}

func incr (x: Int) -> Int {
    return x + 1
}

func isPrime (p: Int) -> Bool {
    if p <= 1 { return false }
    if p <= 3 { return true }
    for i in 2...Int(sqrtf(Float(p))) {
        if p % i == 0 {
            return false
        }
    }
    return true
}

incr(x: 5)
square(x: incr(x:5))

5 |> incr |> square
square <| incr <| 5

5 |> (incr >>> square)

public func curry<A, B, C>(_ function: @escaping ((A, B)) -> C) -> (A) -> ((B) -> C) {
    return { (a: A) -> (B) -> C in { (b: B) -> C in function((a, b)) } }
}

func sum(x: Int, y: Int) -> Int {
    return x + y
}


5 |> curry(sum) <| 5


