//: [Previous](@previous)
import Foundation
//: #枚举内存布局
//: ## 原始值枚举类型
enum TestEnum{
    case test1,test2,test3
}

var t = TestEnum.test1
t = TestEnum.test2
t = TestEnum.test3

print(MemoryLayout<TestEnum>.size);
print(MemoryLayout<TestEnum>.stride);
print(MemoryLayout<TestEnum>.alignment);

//: ## 关联值类型
enum TestEnum1 {
    case test1(Int,Int,Int) //占24个字节
    case test2(Int,Int)     //16个字节
    case test3(Int)         //8个字节
    case test4(Bool)        //1个字节
    case test5              //1个字节
}
//: + 关联值类型需要一个字节来存储成员值，关联值使用所需最大的关联值内存空间来存储

//: ## 特殊类型
enum TestEnum2 {
    case test
}
//: + 这种情况下不需要暂用任何内存，因为你不需要去区分不同的枚举值，实际使用到的内存为0，分配的内存大小为1，内存对齐为1

//: # 汇编
//: ## 程序的本质
//: + 软件/程序的执行过程：程序从内存加载到内存中cpu读取内存里面的指令控制计算机的使用
//: + cup:寄存器、运算器、控制器
//: + cup通常情况下会将内存中的数据存储到寄存器中，然后再对寄存器中的数据进行运算
//: + 假设现在内存中有一个数值为3的数据，现在想把它进行加一，cpu会怎么做呢？
//: >> 1. 首先cup会把3的值到rax寄存器中：movq 3的值 ，%rax
//: >> 2. 然后让rax寄存器与1相加：addq $0x1, %rax
//: >> 3. 最后将值赋值给新的内存空间： movq %rax，新的内存空间

//: ## 语言发展
//: + 机器语言由0和1组成
//: + 汇编语言用符号代替0和1，比机器语言更便于阅读和记忆
//: + 高级语言c\c++\java...,更接近于人类自然语言

/*:
## 操作对比：
 将寄存器bx的内容送入寄存器ax
 + 机器语言：1000100111011000
 + 汇编语言：movw %bx, %ax
 + 高级语言：ax = bx
 **/

//: + 高级语言->汇编语言->机器语言（计算机可以识别）
//: + 汇编语言与机器语言一一对应，每一条机器指令都有一之对应的汇编指令
//: + 汇编语言可以通过编译得到机器语言，机器语言可以通过反编译得到汇编语言
//: + 高级语言可以通过编译得到汇编语言，但汇编语言几乎不可能通过反编译还原得到高级语言

//: ## 汇编语言的种类
//: + 8086汇编（16bit）
//: + x86汇编（32bit）
//: + x64汇编（64bit）
//: + ARM汇编（嵌入式，移动设备）
//: ## x86、x64根据编译器的不同，有两种书写格式
//: + intel:Windows系
//: AT&T:Unix系
//: ## 作为ios开发工程师，最主要的汇编语言是
//:+ AT&T汇编->ios模拟器
//: + ARM汇编 -> ios真机

//: ## AT&T汇编
//: + 有16个常用寄存器：%rax、%rcx、%rdx、%ris、%rbp、%rsp、%r8、%r9、%r10、%r12、%13、%r14、%r15
//: ## 寄存器用途
//: + %rax常用做函数返回值使用
//: + %rdi、%rsi、%rdx、%r8、%r9等寄存器用于存放函数参数
//: + %rsp、%rbp用于栈操作

/*:
 ## 常见汇编指令
 + movq -0x18(%rbp),%rax //将rbp的寄存器存放的内存地址减0x18得到的地址的值存放到rax寄存器
 + leaq  -0x18(%rbp),%rax //将rbp寄存器的内存地址减0x18得到的内存地址存放到rax寄存器
 + jmp 0x4001002 跳转到内存地址为0x4001002的汇编指令处
 + call 0x4001002 跳转到 内存地址为0x4001002的函数
 + call *%rax 跳转到寄存器rax存放的地址的函数
 + r开头的寄存器是64bit；e开头的是32bit；ax、bx、cx16bit；ah、al 8bit
 ## 操作数长度
 + q 64位、b 8位、s 32位 、l 32位整形64位浮点型、t 80位浮点型
 
 ## lldb常用指令
 + 读取寄存器的值： register read/格式 寄存器名称 例如：register read/x 寄存器
 + 修改寄存器的值:  register write rax 10  将10写入到寄存器rax中
 + register read 查看所有寄存器里的值
 + "x/数量-格式-字节大小 内存地址" 读取内存中的值例如：x/3xw 0x889897979
 + thread step -over、next 、n：单步运行、把函数当做整体一步运行
 + thread step -in 、step、s：单步运行遇到子函数会进入子函数
 ## 格式
 ### 进制
 + x是16进制、f是浮点、d是十进制
 ### 字节大小
 + b 一个字节
 + h 2个字节
 + w 4个字节
 + g 8个字节
 */

//: [Next](@next)
