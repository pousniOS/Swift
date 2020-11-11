//: [Previous](@previous)

import Foundation
//: ## 函数类型（Function Type）
//: + 每一个函数都是有类型的，类型由形式参数类型、返回值类型组成
func test(){}//void类型或者()->()
func sum(a:Int,b:Int)->Int{//(Int,Int)->Int类型
    return a+b
}
//: + 定义函数变量
var sum1:(Int,Int)->Int = sum
sum1(10,10)//调用时不需要参数标签
//: + 函数类型作为函数参数
func sum3(a:Int,b:Int)->Int{
    return a+b
}
func difference(a:Int,b:Int)->Int{
    return a-b
}
func printResult(_ matchFunction:(Int,Int)->Int,a:Int,b:Int)->Void{
    print("Result：\(matchFunction(a,b))");
}
printResult(sum,a:10,b:10)
printResult(difference,a:10,b:10)
//: ### 函数类型作为函数返回值
//: + 返回值类型是函数的函数，叫做高级函数
func next(_ input:Int)->Int{
    return input+1
}
func previous(_ input:Int)->Int{
    return input-1
}
func forward(_ forward:Bool)->(Int)->(Int){
    return forward ? next : previous//三目运算符之间需要空格隔开
}
forward(true)(5)
forward(false)(6)

//: ### typealias
//: + typealias用来给类型取别名
typealias Byte = Int8
typealias Short = Int16
typealias Long = Int64

typealias Date = (year:Int,month:Int,day:Int)
func test(_ date:Date){
    print("\(date.year)-\(date.month)-\(date.day)")
}
test((2020,11,9))
//: + 按照swift标准库的定义，Void就是空元组()
typealias Void = ()
//: [Next](@next)
