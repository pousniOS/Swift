//: [Previous](@previous)

import Foundation
//: ## 关联值-内存布局
//: + 可以使用MemoryLayout获取数据类型占用的内存大小
var age = 10
MemoryLayout<Int>.size      //实际用到的大小
MemoryLayout<Int>.stride    //变量实际占用的空间的大小
MemoryLayout<Int>.alignment //内存对齐

MemoryLayout.size(ofValue: age)
MemoryLayout.stride(ofValue: age)
MemoryLayout.alignment(ofValue: age)

enum Password {
    case number(Int,Int,Int,Int)
    case other
}

MemoryLayout<Password>.size
MemoryLayout<Password>.alignment
MemoryLayout<Password>.stride

var pwd = Password.number(1,1,1,1)
MemoryLayout.size(ofValue: pwd)
MemoryLayout.stride(ofValue: pwd)
MemoryLayout.alignment(ofValue: pwd)

enum Season:String{
    case spring,summer,autumn,winter
}
Season.spring.rawValue
MemoryLayout<Season>.size
MemoryLayout<Season>.alignment
MemoryLayout<Season>.stride


var aumot = 30167.78+368754.77+75519.15+4435
//: + 探究内存细节的小工具：[存小工具](https://github.com/CoderJMLee/Mems)
//: [Next](@next)
