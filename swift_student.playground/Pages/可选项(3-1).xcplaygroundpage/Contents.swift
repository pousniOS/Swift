//: [关联值-内存布局](@previous)

import Foundation

/*:
 ## 可选项(Optional)
 + 可选项一般叫可选类型，它允许将值设置为nil
 + 在类型名后面加*?*来定义可选项
 */
var name:String? = "Jack"
name = nil

/*:
 '''
 var str:Stirng = "123"
 str = nil
 '''
 */

var array:Array = [1,2,4,5,6,7]
func get(_ index:Int)-> Int?{
    if index >= array.count || index<0  {
        return nil
    }
    return array[index];
}
print(get(3));
get(100)
//: + 可选项其实是对其它类型的一个包装，可以理解为一个盒子
//: + 如果为nil ，那么说明是一个空盒子
//: + 如果不为nil，那么盒子里装的是：被包装类型的数据

var age : Int? //默认是nil
age = 10
age = nil

//: + 如果需要从可选项中取出数据,需要使用*!*号进行强制解包

age = 10
age! + 10
print(age!)

age = nil
//: 如果可选项对应的值是nil，进行强制解包将会报错

//: ### 可选项绑定
//: + 我们可以用可选项绑定来判断可选项是否包含值
//: + 如果包含则会自动解包，把值赋给临时的常量或者变量，并返回true，否则返回false

if let x = Int("120o3") {
    print("解包成功\(x)")
}else{
    print("字符串转换失败")
}

enum ErrorCode:Int{
    case SeverError = 1
    case ClientError = 2
}

if let code = ErrorCode.init(rawValue: 10){
    switch code {
    case .SeverError:
        fallthrough
    case .ClientError:
        fallthrough
    default:
        print("SDFASDF")
    }
}


switch ErrorCode.init(rawValue: 10) {
case .SeverError:
    fallthrough
case .ClientError:
    fallthrough
case .none:
    print("xxxx")
}

//: 等价写法

if let a = Int("1") {
    if let b = Int("2") {
        if a<b {
            print("Right")
        }
    }
}

if let a = Int("1") ,let b = Int("2"),a<b {
    print("Right1")
}
//: + while循环中使用可选项绑定

let list = ["43","2","sdf","2","4"]
var index = 0
var  sum = 0

while let x = Int(list[index]) , x>0 && index<list.count{
    sum += x
    index += 1
}
print("result:\(sum)")

//: 空合并运算符*??*
//: *public func ??<T>(optional:T?,defaultValue:@autoclosure() throws->T?)->rethrows->T?*
//: *public func ??<T>(optional:T?,defaultValue:@autoclosure() throws->T)->rethrows->T*

//: 1. a??b
//:   + a是可选项
//:   + b可以是可选项也可以不是
//:   + a和b的存储类型必须相同
//:   + 如果a不为nil，返回a
//:   + 如果a为nil，就返回b
//:   + 如果b不是可选项，返回a时自动解包

let a:Int? = 10
let b:Int? = 20
let c = a ?? b
print(c)

let A:Int? = 10
let B:Int = 20
let C = A ?? B
print(C)

//: 空合并运算符（??）与可选项绑定结合使用
let test1:Int? = 0
let test2:Int? = nil

if let test = test1 ?? test2 {
    print(test)
}

//: 2. guard语句
/*:
 '''
 guard 条件 else{
 // do something...
 退出当前作用域
 // return、break、continue、throw、error
 }
 '''
 */
//: + 当guard 语句条件为false时，就会执行大括号里面的代码
//: + 当guard 语句条件为ture时，就会跳过guard语句的执行
//: + guard适用于“提前退出”
//: + 当guard用来做可选型绑定是，绑定的常量（let）和变量（var）也能在外层作用域中使用
func login(info:[String:String])-> Void{
    guard let name = info["name"] else {
        print("请输入用户名！！！")
        return
    }
    guard let passward = info["password"] else {
        print("请输入密码！！！")
        return
    }
    print("用户名：\(name) 密码:\(passward)")
}
login(info: ["name":"yangYue","password":"843464"])

//: 3. 隐式解包（Implicitly unwrapped Opational）
//: + 在某些情况下，可选项在设置值之后，就会一直拥有值
//: + 在这种情况下可以去掉检查，不用每次访问时去进行解包，因为能确定它每次访问时都有值
//: + 我们可以在可选项后面加一个**!** 来进行定义隐式解包可选项

let num1:Int! = 10
let num2:Int = num1
let num3:Int
//let num3:Int! = nil
//let num4:Int = num3

//: 4. 字符串插值
//: + 可选项字符串插值时，编译器会发出警告
var num4:Int? = 10
//: 至少三种方法消除警告
print("age\(num4!)")
print("age\(String(describing:num4))")
print("age\(num4 ?? 0)")

//: 5. 多重可选项
var var1:Int? = 10 //盒子里面装的是10
var var2:Int?? = var1 //盒子里面装的是盒子1，盒子1装的是10
var var3:Int?? = 10 //盒子里面装的是盒子1，盒子1装的是10

var value1:Int? = nil //是空盒子
var value2:Int?? = value1 //盒子里面装的是盒子1，盒子1装的是nil
var value3:Int?? = nil // 是空盒子

(value2 ?? 1) ?? 2
(value3 ?? 1) ?? 2

//: + 可以使用lldb指令frame variable -R 或者 fr v -R 查看区别
//: [Next](@next)
