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
