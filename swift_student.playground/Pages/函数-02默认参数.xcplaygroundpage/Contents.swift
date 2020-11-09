//: [基础语法、汇编初探](@previous)

import Foundation
//: ## 函数默认参数(Defult parameter value)
//: 1. 参数可以有默认值
//: 2. c+默认参数值必须从右往左设置。由于swift有参数标签，因此没有这样的限制
func check(name:String = "firstPerson", age:Int) -> Void{
    print("name:\(name),age:\(age)")
}
check(age: 2000000)
check(name:"yangYue" , age: 18)

//: 3. 但是在省略标签时，需要特别注意
func test(_ one:Int=10, _ two:Int=20, _ three:Int=20){
    print("one:\(one)  two:\(two)  three:\(three)")
}
test(30)

//: ## 可变参数（Variadic Parameter）
//: 1. 类型+**...**
//: 2. 一个函数最多只能有一个可变参数
func sum(numbers:Int...) -> Int{
    var sum:Int = 0;
    for x in numbers {
        sum += x;
    }
    return sum
}
print("\(sum(numbers: 1,2,3,4,5))");

//: 3. 紧跟在可变参数后面的参数不能省略标签
func expand(list:Int...,proportion:Int)-> Array<Int>{
    var array:Array<Int> = Array<Int>()
    for item in list {
        array.append(item*proportion)
    }
    return array
}
print(expand(list: 1,2,3,4,5,6, proportion: 10))

//: ## swift自带的print函数
//: 1. public func print(_ items: Any..., separator: String = " ", terminator: String = "\n")
//:    + items:任意类型的可变参数
//:    + separator:分隔符默认是“ ”
//:    + terminator:结束符号默认是"\n"

//: ## 输入输入输出参数
//: 1.可以用inout定义输入输出参数：可以在函数内部修改外部实参的值
//: 2. inout的本质是地址传递
//: 3. inout只能传入可以被多次赋值的变量
func swapValue(_ V1:inout Int,_ V2:inout Int) ->Void{
    (V1,V2) = (V2,V1)
}

var a = 1;
var b = 2;
swapValue(&a, &b)
print("a:\(a),b:\(b)")

//: ## 汇编初识
//: 1. 常见汇编指令
//:    +     0x100002d1e <+62>: callq【函数调用】  0x100002d40【函数地址】               ; student_swift.test(inout Swift.Int) -> () at main.swift:10
//:    +     0x100002d17 <+55>: leaq 【函数传参地址传递】   0x544a(%rip)【0x544a+rip 传递给rdi、**%**开头的代表寄存器】, %rdi        ; student_swift.number : Swift.Int
//:    +     0x100002d50 <+16>: movq   $0x14, (%rdi) 【"()"代表寻找rdi寄存器地址所在的空间】//将20赋值给rdi寄存器

//: [Next](@next)
