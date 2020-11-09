import UIKit
/*:
 # 一级标题
 ## 无序列表
 - First Itme
 - Secound Item
 
 ## 有序列表
 1. First Item
 2. Secound Item
 
 ## 笔记
 > This is a note
 ---
 
 ## 图片
 ! [Logo](logo.png "Local image")
 
 ## 链接
 * [小马哥教育](https://520it.com)
 
 ## 粗体/斜体
 这是 **Bold**,这是*Italic*
 
 [下一页](@next)
 [上一页](@previous)
 */

/*:
 # 基础语法、汇编初探
 ---
 ## 基础知识
 
 1. API 应用程序编程接口
 >+ 源代码和库之间的接口
 
 2.ABI 应用程序二进制接口
 >+ 应用程序与操作系统之间的底层接口
 >+ 涉及的内容有：目标文件格式、数据类型的大小\布局\对齐、函数调用约定等等
 
 3. 随着ABI的稳定，swift的语法基本不会再有太大的变动，此时正是学习swift的最佳时刻
 4. Swift完全开源：[开源地址](https://github.com/apple/swift)\,主要采用c++编写
 
 5. 编译器：
 >+ 1.前端：此法分析。。。
 >+ 2.后端：生成对应平台的二进制代码(LLVM)
 >+ 3.c编译器的前端是clang、Swift 是Swift AST\SwiftC\Swift IL
 >+ 4.swiftc存放在x-code内部，位置contents/Developer/Tollchains/XcodeDefault.xctollchain/usr/bin
 
 6. swiftc的一些操作
 >+ 生成语法树:swiftc -dump-ast main.swift
 >+ 生成最简洁的SIL代码：swiftc -emit-sil main.swift
 >+ 生成LLVM IR代码：swiftc -emit-ir main.swift -o main.ll
 >+ 生成汇编代码：swiftc -emit-assembly main.swift -o main.s
 >+ 在x-code里面以美元开头的数值是常数
 
 ## swift语法
---
 1. 在swift中声明变量使用var 常量使用let
 
 >+ swift不用写main函数，swift将全局范围内的首句可执行代码作为程序入口
 一句代码尾部可以不用；号隔开，多句代码写到一起时必须使用分号隔开
 */

var a = 10
let b = 20
var x = 10 ; var y = 20

/*:
 2. 在swift中变量拼接带字符串上可以通过 "{字符串}+\({变量})"
 */

"hellow world + \(a)"

/*:
 3. 可以通过playground 实时阅览UI 例如:
 >+ let view = UIView()
   
    .
    .
    .
   
 PlaygroundPage.current.liveView = view
  */

let view = UIView(frame: CGRect(x: 0, y: 0, width: 90, height: 90))
view.backgroundColor = UIColor.red
import PlaygroundSupport
PlaygroundPage.current.liveView = view

/*:
4. 注释
>+ //单行注释
>+  /\*\*多行注释/\*\*多行注释\*\/\*\/  多行注释，多行注释可以内嵌
*/

/*:
 5. 常量与变量
 >+. 只能赋值一次
 >+. 它的值不要求在编译时期确定，但使用之前必须赋值一次
 >+. 常量变量在初始化之前，都不能使用
 */

let let_a = 10
var height:Float = 30.9

/*:
 6. 标识符
 >+ 标识符（例如变量、常量、函数名）几乎可以使用任何字符
 >+ 标识符不能以数字开头，不能包含空白字符、制表符、箭头灯特殊字符
 */
func 🐂🍺(){
    print(🐂🍺)
}
🐂🍺()

let 👽 = "ET"
var 🥛 = "milk"

/*:
 7. 常见数据类型
 >+ 值类型（value type）：
 >>+ 1. 枚举（enum）例如：optional
 
 >>+ 2. 结构体（struct）例如：Bool、Int 、 Float、Double、Character、String、Array、Dictionary、Set
 >>>+ 1. 整数类型：Int8、Int16、Int32、Int64、UInt8、UInt16、UInt32、UInt64
 >>>+ 2. 在bit32位的平台，Int等价于Int32 ，Int等价于Int64
 >>>+ 3. 整数的最值：UInt8.max、Int16.min
 >>>+ 4.一般情况下，都是直接使用int即可
 */
print(UInt8.max)
print(Int8.min)

/*:
 >>>+ 5.浮点类型：Float ，32位，精度只有6位；Double，64位，精度至少15位
 */

let letFloat : Float = 32.0
let letDouble : Double = 32.0


/*:
 >+ 3. 引用类型 例如：类（class）
*/

/*:
>+ 5.字面量
>>+ 1.布尔
 **/
let bool = true;



/*:
>>+ 2.  整数
 */

let intDecimal = 17 //十进制
let intBinary = 0b10001 //二进制
let intOctal = 0o21 //八进制
let intHexadecimal = 0x11 //十六进制

/*:
>>+ 3.字符串
 */
let string = "string"

/*:
 >>+ 4.字符
 */
let charcater: Character = "🙅‍♂️" //可存储ASCII字符串、Unicode字符

/*:
 >>+ 5.浮点数
 */
let doubleDecimal = 125.0 //十进制，等价于1.25e、0.0125等价1.25e-2
let doubleHexadecimal1 = 0xFp2 //十六进制，意味着15x2^2,相当于十进制的60.0
let doubleHexadecimal2 = 0xFp-2//十六进制,意味着15x2^-2,相当于十进制的3.75

/*:
>>+ 6.整数和浮点数可以额外的添加零和下划线来增强可读性 例如：
*/
100_000
100_000.000_000_1
00001234.56

/*:
 >>+ 7. 数组
 */
let array = [1,2,3,4]

/*:
 >>+ 8.字典
 */
let dictionary = ["age":18,"height":180,"weight":120]

/*:
 >+ 6. 类型转换
 >>+ 1.不同类型这间是不能用来做运算的需要通过类型转换
 >>+ 2.字面量可以直接相加的，因为字面量没有明确的类型
 */
let int1: UInt16 = 2_00
let int2: UInt32  = 2_00

let int3 = int1 + UInt16(int2)

let double1 = 10 + 0.2353

/*:
 >+ 6. 元组类型
 */
let error = (400,"Not Found")
error.0
error.1

let http404Error = (404,"Not Found")
print("the status code is\(http404Error)")
let (code,errorMsg) = http404Error
print("the status code is \(code)")
let (status,_) = http404Error

let http200Status = (statusCode:200,desc:"OK")
print("the status code is \(http200Status.statusCode)")
