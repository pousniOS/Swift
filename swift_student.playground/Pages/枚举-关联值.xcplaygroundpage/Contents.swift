//: [Previous](@previous)

import Foundation
//: ## 枚举-关联值
//: ### 枚举的基本用法
//enum Direction{
//    case north
//    case south
//    case east
//    case west
//}
enum Direction {
    case north,south,east,west
}
var dir:Direction = Direction.north
dir = .north
print(dir)

switch dir {
case .north:
    print("north")
case .south:
    print("south")
case .east:
    print("east")
case .west:
    print("weast")
}

//: ### 关联值（Associated Values）
//: + 有时候我们将枚举的成员值跟其他类型的关联存储在一起，会非常有用
enum Score{
    case points(Int)
    case grade(Character)
}
var score = Score.points(90)
var scre1 = Score.grade("A")

switch score {
case let .points(i):
    print("point:\(i)")
case let .grade(i):
    print("grade:\(i)")
}

enum Date{
    case digit(year:Int,month:Int,day:Int)
    case string(String)
}
var date = Date.digit(year:2020,month:3,day:23)
var date1 = Date.string("2020-12-23")
switch date {
case .digit(let year, let month,let day):
    print("\(year)-\(month)-\(day)")
case .string(let dateString):
    print(dateString)
}

//: ### 原始值（raw values）
//: + 枚举成员可以使用相同类型的默认值预先关联，这个叫做原始值
enum PokerSuit:Character{
    case spade = "A"
    case heart = "B"
}
var pok = PokerSuit.spade
print(pok.rawValue)

//: #### 隐式枚举值（Implicitly Assigned Raw Values）
//: + 如果swift的原始值类型是String、Int则编译器会默认设置原始值
enum Direction1 :String{
    case north,south,east,west
}
print(Direction1.north.rawValue);//rawValue 是String类型并且变量类型是String类型

//: ### 递归枚举（Recursive Enumeration）
/**:
 indirect enum AritExpr{
     case number(Int)
     case sum(AritExpr,AritExpr)
     case difference(AritExpr,AritExpr)
 }
 */

enum AritExpr{
    case number(Int)
    indirect case sum(AritExpr,AritExpr)
    indirect case difference(AritExpr,AritExpr)
}
func calculate(_ expr:AritExpr) -> Int{
    switch expr {
    case .number(let value):
        return value
    case .sum(let a,let b):
       return calculate(a)+calculate(b)
    case .difference(let a, let b):
        return calculate(a)-calculate(b)
    }
}

    var one = AritExpr.number(1)
    var two = AritExpr.number(2)
    var sum = AritExpr.sum(one,two)
    var diff = AritExpr.difference(one,two)

    print(calculate(sum))
    print(calculate(diff))

//: [Next](@next)




