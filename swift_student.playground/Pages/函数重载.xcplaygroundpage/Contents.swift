//: [Previous](@previous)

import Foundation
//: ## 函数重载
//: ### 规则
//: + 函数名相同
//: + 参数不同或参数类型或参数标签不同

func sum(_ v1:Int,_ v2:Int)-> Int{
    return v1+v2
}
func sum(v1:Int,v2:Int)->Int{
    return v1+v2
}
func sum(v1:Double,v2:Double)->Double{
    return v1+v2
}
func sum(a:Int,b:Int)->Int{
    return a+b
}
//: ### 函数重载注意点
//: + 返回值类型与函数重载无关

/*:
```
 func add(a:Int,b:Int)-> Int{
     return a+b
 }
 func add(a:Int,b:Int){
     
 }
 add(a:10,b:10);
 ```
 **/
//: + 默认参数值和函数重载一起使用产生二义性时，编译器并不会报错（c++中会报错）
func sum1(v1:Int,v2:Int,v3:Int = 10)->Int{
    return v1+v2+v3
}
func sum1(v1:Int,v2:Int)->Int{
    return v1+v2
}
print(sum1(v1:10,v2:10))//会调用func sum1(v1:Int,v2:Int)->Int

//: + 可变参数、省略参数标签、函数重载一起使用产生二意时，编译器可能会报错

func sum2(a:Int,b:Int)->Int{
    return a+b
}
func sum2(_ a:Int, _ b:Int)->Int{
    return a+b
}
func sum3(_ list:Int...)->Int{
    
    var sum = 0
    for item in list {
        sum += item
    }
    return sum
}
sum2(1,2)
//: [Next](@next)
