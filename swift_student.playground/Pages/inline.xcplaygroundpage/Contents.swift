//: [Previous](@previous)

import Foundation
//: ## @inline
//: + **@inline(never)** 永远不会被内联(即使开启编译器优化)
@inline(never) func test()->Void{
    print("test")
}
test()
//: + **@inline(__always)** 开启编译器优化,即使代码很长也会被内联(除递归函数,动态派发的函数)
@inline(__always) func test1()->Void{
    print("test1")
}
test1()
//: + 在release模式下,编译器是会自己去决定哪些函数需要内联,所以其实是没有必要去指定
//: [Next](@next)
