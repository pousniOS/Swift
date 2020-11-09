//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

/*:
 ## if-eles
 + if后面的条件语句可以省略小括号
 + 条件后的大括号不可以省略
 + if 后面的条件只能是**Boll**
 **/
let age = 4
if age >= 22 {
    print("Get married")
} else if age >= 18 {
    print("Being a adult")
} else if age >= 7 {
    print("Go to school")
}else {
    print("Just a child")
}

/*:
 ## While
 + **repeat {} while "条件"** 相当于c语言的 **do{}while "条件"**
 + 为什么不使用 ~~num++~~、~~num--~~ swift3,因为swift3开始去掉了++、--
 **/
var numb = 5

while numb>0 {
    print("num is \(numb)")
    numb -= 1
}


var num = 5
repeat {
    print("num is \(num)")
    num -= 1
} while num > 0

/*:
 ## for
 + 闭区间运算符：a...b (a<= 取值 <=b)
 + 半开区间运算符：a..<b(a<= 取值 <b)
 **/

let items = ["A","B","C","D"]
for item in 1...3 {
    print(items[item])
}

let rang = 1...3
for item in rang {
    print(items[item])
}

let a = 1
let b = 3
for item in a...b {
    print(items[item])
}
//:+ 如果用不到item 则可以将**item**替换成下划线"_"
for _ in 1...3 {
    print("abcdefg")
}
/*:
 ### for - 区间运算符用在数组上
 + 单侧区间：让一个区间朝一个方向尽可能的远
 **/
let list = ["A","B","C","D"]
for item in list[1...3] {
    print(item)
}

for item in list[1...] {
    print(item)
}

let rg = ...5
rg.contains(7)
rg.contains(2)

/*:
 ## 区间类型
 **/
let range1: ClosedRange<Int> = 1...3 //关闭区间范围类型
let range2: Range<Int> = 1..<3
let range3:PartialRangeThrough<Int> = ...5

//: + 字符、字符串也能使用区间运算符，但默认不能用在for-in中
let stringRange1 = "cc"..."ff" //CloseRange<String>不声明则默认是String类型
stringRange1.contains("cb")
stringRange1.contains("cd")
stringRange1.contains("cg")
let stringRange2 = "a"..."f"
stringRange2.contains("b")
stringRange2.contains("g")

let chatacterRange:ClosedRange<Character> = "\0"..."~"//包含所有可能用到的ASCII字符
chatacterRange.contains("G")

//: 点间隔的区间值

let hours = 11
let hourInterval = 2
for tickMark in stride(from:4, through:hours, by:hourInterval) {
    print("\(tickMark)")
}
//: ## switch
var number = 1
switch number {
case 1:
    print("number is 1")
case 2:
    print("number is 2");
default:
    print("number is other")
}
//: + **case**、**default**后面不能写大括号**{}**
//: + 默认可以不写**break** ，并不会贯穿到后面的条件
//: +  fallthrough可是实现贯穿效果
//: + switch必须保证可以处理所有情况
//: + case、default后面至少需要有一条语句
//: 如果不想做任何事，加break即可

switch number {
case 1:
    print("number is one")
case 2:
    fallthrough
default:
    break
}
//: + 如果你能保证处理所有情况、也可以不必使用**default**
//: + switch 也支持Character，String类型

let string = "one"
switch string {
case "one","1":
    print("is one")
default:
    break
}

//: + 区间匹配，元组匹配
let count = 62
switch count {
case 1...30:
    print("1...30")
case 31...80:
    print("31...80")
default:
    print("")
}

let point = (1,1)
switch point {
case (_,1...10):
    print("(_,1...10)")
default:
    break
}
//: "_"可以忽略某一个值
//: + 关于case的匹配问题，属于模式匹配（pattern Matching）的范畴
//: + 值绑定
let point1 = (2,2)
switch point1 {
case (let x,2):
    print("\(x)")
default:
    break
}
//: + 必要时可以把**let**改完**var**
//: ## where
let point2 = (1,-1)
switch point2 {
case let (x,y) where x == -y:
    print("on the line x == -y")
default:
    break
}

let list1 = [10,-23,9,-35,90]
var sum = 0
for item in list1 where item>0 {
    sum += item
}
print(sum)

//: ## 标签语句
outer: for i in 1...4 {
    for k in 1...4{
        if k == 3 {
            continue outer
        }
        
        if i == 3 {
            break outer
        }
        print("i==\(i)","k==\(k)")
    }
}

//: 函数的定义

func pi() -> Double{
    return 3.14
}
func sum(v1:Int , v2:Int) -> Int{
    return v1+v2
}
print(sum(v1: 100, v2: 100))

var aumot = 33810.03+65270.25+368531.16
