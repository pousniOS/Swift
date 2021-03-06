# shell学习
## 文本处理工具
### 1. grep工具：
> grep是行过滤工具，根据关键字过滤  

**语法和选项**
*语法：*
```
# grep [选项] '关键字' 文件名
```
*常见选项*

```
OPTIOS:

-i//不区分大小写
-v//查找不包含指定内容的行，方向选择
-w//按单词搜索
-o//打印匹配关键字
-c//统计匹配的次数
-n//显示行号
-r//逐层遍历目录查找
-A//显示匹配行及后面多少行
-B//显示匹配行及前面多少行
-C//显示匹配行前后多少行
-l//只列出匹配的文件名
-L//列出不匹配的文件名
-e//使用正则匹配
^key//一关键字开头
key$//一关键字结尾
^$//匹配空行
--color=auto //可以将找到的关键字加上颜色的显示
```

*颜色显示设置（别名设置）：*
```
临时设置：
# alias grep = 'grep -- color=auto'//只针对当前终端和当前用户有效

永久设置：
在 /etc/bashrc 文件里添加 alias grep = 'grep --color=auto' 然后重新读取该文件用 source /etc/bashrc

```

### 2.cut工具

>cut列截取工具，用于列的截取  

**语法和选项**
*语法*
```
# cut 选项 文件名
```

*常见选项*
```
-c //以字符串为单位进行分割截取
-d //自定义分隔符，默认为制表符\t
-f //与-d一起使用，指定截取哪个区域
```

*举例说明:*
```
#cut -d: -f1 1.txt 以：冒号分割，截取第一列内容
#cut -d: -f1,6,7 1.txt 以冒号分割，截取1、6、7列内容
```

### 3. sort工具
> sort工具用于排序；它将文件的每一行作为一个单位，从首字母向后，依次按ASCII码值比较，最后将他们按升序列出   

**语法和选项**
```
-u：去掉重复行
-r：降序排列，默认是升序
-o：将排序结果输出到文件中，类似重启定向符号>
-n：以数字排序，默认是按照字符排序
-t：分隔符
-k：第N列
-b：忽略前导空格
-R：随机排序，每次运行的结果均不同
```
*举例说明*

```
sort -nr -t '\' -k2 shell_test.txt -o shell_test1.txt // 以数字的方式"\"为分割符号的第2列降序排序
```

### 4.uniq工具
> uniq用于去除连续的重复行 
```
常见选项：
-i：忽略大小写
-c：统计重复行次数
-d：只显示重复行

举例说明：
# uniq 2.txt
# uniq -d 2.txt
# uniq -dc 2.txt

```

### 5. tee工具
> tee工具是从标准输入读取并且输入到标准输出文件，即：双向覆盖重定向（屏幕输出|文件输入）  

```
选项：
-a：双向追加重定向

# echo hello world
# echo hello world|tee file1
# cat file1
# echo 999|tee -a file1
# cat file1
```
### 6. diff工具
> diff工具用于逐行比较文件的不同  

注意：diff描述两个文件的不同方式是告诉我们怎样改变第一个文件后与第二个文件匹配 

** 语法和选项 **
*语法*
```
diff [选项] 文件1 文件2
```
*常用选项*
```
-b：不检查空格
-B：不检查空白行
-i：不检查大小写
-w：忽略所有的空行
--normal：正常格式显示（默认）
-c：上下文格式显示
-u：合并格式显示
```
**比较文件夹里的文件不同**
```
# diff -q dir1 dir2 

```

**其他小技巧**

有时候我们需要以一个文件为标准去修改其他一个文件，并且修改的地方较多时，我们可以通过补丁的方式完成。

```
1. 先找出文件不同，然后输出到一个文件
# diff -uN file1 file2 > file.patch
-u：上下文模式
-N：将不存在的文件当做空文件
2. 将不同内容补丁到文件
# patch file1 file.patch
patch file file1
3. 测试验证
diff file file2

```
### 7. paste工具
> paste工具用于合并文件行  

```
常用选项：
-d：自定义间隔符，默认是tab
-s：串行处理，非并行
```

### 8. tr工具
> tr用户字符转换，替换和删除；主要用于删除文件中控制字符或进行字符转换  

**语法选项**
*语法*
```
用法1：命令的执行结果交给tr处理，其中string1用于查询，string2用于转换处理
# commands|tr ‘stirng1’ ‘string2’

用法2：tr的处理内容来自文件，记住要使用‘<’标准输入
# tr ‘string1’ ‘string2’ < fielname

用法3：匹配string1进行相应操作，如删除操作
# tr options ’string1‘ < filename
```

*常用选项：*
```
-d：删除字符串1中所有输入字符
-s：删除所有重复出现字符序列，只保留一个；即将重复出现字符串压缩为一个字符串
```

*常用匹配字符串*
```
a-z或[:lower:] 匹配所有小写字母
A-Z或[:upper:] 匹配所有大写字母
0-9或[:digit:] 匹配所有数字
[:alnum:] 匹配所有字母和数字
[:alpha:] 匹配所有字母
[:blank:] 匹配所有水平空白
[:punct:] 匹配所有标点符号
[:space:] 匹配所有水平或者垂直空格
[:cntrl:] 匹配所有控制符

```

*其他扩展*
```
# ifconfig： 获取相关配置例如ip地址
# ip a：获取相关配置例如ip地址
```

## bash的特性
### 1. 命令和文件自动补全
> tab 只能补全命令和文件（RHEL6/Centos6）

### 2. 常见快捷键
```
^c      终止前台运行的程序
^z      将前台运行的程序挂起到后台
^d      退出等价于exit
^l      清空屏幕
^a|home 光标移动到命令的最前端
^e|end  光标移动到命令行的后端
^u      删除光标前所有字符
^k      删除光标后所有字符
^r      搜索历史命令

```

### 3. 常用通配符（**重点**）
```
*                       匹配0个或者多个任意字符
?                       匹配任意单个字符
[list]                  匹配[list]中的任意单个字符,或者一组单个字符
[!list]                 匹配除[!list]中的任意单个字符
{string1,string2....}   匹配string1、string2或更多字符

```
### 4. bash中的引号（**重点**）
* 双引号""：会把引号的内容当整体来看待，允许通过$符号引用其他变量值
* 单引号'' ：会把引号的内容当整体来看待，禁止引用其他变量值，shell中特殊符号都被视为普通字符
* 反撇号`` ：反撇号和$()一样，引号或者括号里的的命令优先执行，如果存在嵌套，反撇号不能用

```
macdeMac-mini-2:desktop mac$ echo "$(hostname)"
macdeMac-mini-2.local

macdeMac-mini-2:desktop mac$ echo '$(hostname)'
$(hostname)

macdeMac-mini-2:desktop mac$ echo "hello world"
hello world

macdeMac-mini-2:desktop mac$ echo 'hello world'
hello world

macdeMac-mini-2:desktop mac$ echo `date +%F`
2021-03-02

macdeMac-mini-2:desktop mac$ echo "`date +%F`"
2021-03-02

```

# shell编程模块课程目标
* 1. shell的基本语法结构
   如：变量定义、条件判断、循环语句（for,until、while）、分支语句，函数和数组等；
  2. 基本正则表达式的运用；
  3. 文件处理三剑客：grep、sed、awk工具的使用；
  4. 使用shell脚本完成一些较复杂的任务，如：服务器搭建、批量处理等。
  **说明：以上内容仅仅是基本要求，还有很多很深更难的语法需要扩充学习**
  
  * **本节目标**
- 熟练掌握shell变量的定义和获取（重点）
- 能够进行shell简单的四则运算

## 一、shell介绍
**前言：**

计算机能认识识别机器语言（0和1），如（11000000这种）。但是我们程序员不能直接去写01这样的代码，所以想要将程序员编写的代码运行在计算机上，就必须找"人"（工具）来翻译成机器语言，这个"人"（工具）就是我们所说的编译和解释器。

### 1.编译语言的分类
1. *编译型语言：*
   程序执行前需要一个专门的编译过程，把程序编译成机器语言文件，运行时不需要重新翻译，直接使用编译的结果就行。程序执行效率高，依赖编译器，跨平台性差些。如c、c++

2. *解释行语言：*
   程序不需要编译，程序在运行时由解释器翻译成机器语言，每执行一次都需要翻译。因此效率比较低。比如python、java、JavaScript、shell等都是解释型语言。

**总结**
  编译型语言比解释型语言快，但不如解释型语言跨平台性好。如果做底层开发或者做大型应用或者操作系统一般选择编译型语言；如果是一些服务器脚本以及一些辅助的接口，对速度要求不高、对各个平台的兼容性有要求的话则一般用解释型语言。
  
  ### 2. shell介绍
  > shell介于用户与内核之间，负责命令的解释
  
  *总结*
  * shell就是人机交互的一个桥梁
  * shell的种类
  
```
apple@appledeMBP ~ % cat /etc/shells
# List of acceptable shells for chpass(1).
# Ftpd will not allow users to connect who are not using
# one of these shells.

/bin/bash     是大多数linux默认的shell，包含的功能几乎可以涵盖shell所有的功能
/bin/csh      具有c语言风格的一种shell，具有许多特性，但也有一些缺陷
/bin/dash     小巧高效功能相比少一些
/bin/ksh
/bin/sh       是bash的一个快捷方式
/bin/tcsh     是csh的增强版完全兼容csh
/bin/zsh

```
**思考：shell和终端有什么关系？**
```
apple@appledeMBP ~ % ps
  PID TTY           TIME CMD
33219 ttys000    0:00.04 -zsh
```

### 3. shell脚本

**（一）什么是shell脚本？**

* 一句话概括
简单来说就是将要执行的命令保存到文本中，按照顺序执行。它是解释型的，意味着不需要编译。

* 准确描述
若干命令+脚本的基本格式+脚本特定语法+思想=shell脚本

**（二）什么时候用到脚本？**
**重复化**、复杂的工作，通过把工作的命令写成脚本，以后仅仅需要执行脚本就能完成这些工作。

**（三）shell脚本能干啥？**
1. 自动化软件部署       LAMP/LNMP/Tomcat......
2. 自动化管理              系统初始化脚本、批量更改主机密码、推送公钥......
3. 自动化备份              数据库备份、日志转存......


** (四) 如何学习shell脚本？**

1. 尽可能记忆更多的命令
2. 掌握脚本的标准化格式（指定魔法字节、使用标准的方式运行脚本）
3. 必须熟悉的掌握脚本的基础语法（重点）

**（五） 学习shell脚本的秘诀**
多看（看懂）---->模仿（多练）---->多思考（多写）

**（六）shell脚本的基本写法**

1. 脚本第一行，魔法字符#!指定解释器【必写】
```
#!/bin/bash 表示以下内容使用bash解释器解析

```
**注意：**
如果直接将解释器的路径写死在脚本里，可能在某些系统就会存在找不到解释器的兼容性问题，所以可以使用：#!bin/env 解释器

2. 脚本第二部分，注释（#号）说明，对脚本的基本信息进行描述【可选】

```
#!/bin/env bash

# 一下是对脚本基本信息的描述
# Name：名字
# Desc：描述describe
# path：存放路径

```

3. 脚本第三部分，脚本要实现的具体内容

**（七）shell脚本的执行方法**

1. 标准脚本执行方法（建议）

```
apple@appledeMBP shell_test % ./first.sh  

注意：标准执行方式脚本必须要有可执行权限
```

2. 非标准的执行方式（不建议）
* 直接在命令行指定解释器行
```
apple@appledeMBP shell_test % bash first.sh

-x：一般用于排错，查看脚本的执行过程

apple@appledeMBP shell_test % bash -x first.sh
+ echo 'Hello world'
Hello world
+ echo 'Hello world'
Hello world
+ echo 'Hello world'
Hello world

-n：用来查看脚本的语法是否有问题

apple@appledeMBP shell_test % bash -n first.sh

```

3. 使用source命令读取脚本文件，执行文件里的代码
```
apple@appledeMBP shell_test % source first.sh   

```
**小试牛刀：**写一个没有灵魂的脚本，要求如下：

1. 删除/tmp目录下的所有文件 rm -rf /tmp/*
2. 然后在/tmp目录里创建三个目录，分别是dir1~dir3 mkdir /tmp/dir{1..3}
3. 拷贝etc/hosts文件到刚创建的dir1目录里 cp /etc/hosts /tmp/dir
4. 最后打印"任务于YYYY-MM-DD hh-mm-ss 完成" echo "任务于$(date + %F %T)"

## 二、变量的定义

### 1. 变量是什么？
> 变量是用来保存临时数据，该数据是可以变化的数据。

### 2. 什么时候需要定义变量？
* 如果某个内容需要多次使用，并且在代码中重复出现，那么可以用变量代表该内容。这样在修改内容时，仅仅需要修改变量的值。
* 在代码的运行中，可能需要把某些命令执行的结果保存下来，后续代码需要使用这些结果，就可以直接使用这个变量。

### 3. 变量如何定义？
**变量名=变量值**

变量名：用来临时保存数据
变量值：临时的可变化的数据

```
apple@appledeMBP shell_test % A=hello //定义变量A
apple@appledeMBP shell_test % echo $A
hello
apple@appledeMBP shell_test % echo ${A}
hello
apple@appledeMBP shell_test % unset A //取消变量

```

### 4. 变量的定义规则
> 虽然可以给变量赋予任何值；但是对于变量名也是有要求的

1. 变量名区分大小写
2. 变量名不能有特殊字符
3. 不能以数字开头
4. 等号两边不能有任何空格
5. 变量名尽量做到见名识意

### 5. 变量的定义方式有哪些？

1. 基本方式
> 直接赋值给一个变量

```
apple@appledeMacBook-Pro ~ % A=123456
apple@appledeMacBook-Pro ~ % echo $A
123456
apple@appledeMacBook-Pro ~ % echo ${A}
123456
apple@appledeMacBook-Pro ~ % echo ${A:2:3} //表示从A变量第三个字符开始截取3个字符
345


说明：
$变量名和${变量名}的异同
相同点：都可以调用变量
不同点：${变量名}可以只截取变量的一部分，而$变量名不可以

```

2. 命令执行结果赋值给变量

```
apple@appledeMacBook-Pro ~ % A=`hostname`
apple@appledeMacBook-Pro ~ % echo $A
appledeMacBook-Pro.local

apple@appledeMacBook-Pro ~ % B=$(uname -r)
apple@appledeMacBook-Pro ~ % echo $B
19.6.0


```

3. 交互式定义变量（read）
**目的：** 让用户自己给变量赋值，比较灵活
**语法：** read [选项] 变量名

**常见选项：**
```
-p 定义提示用户的信息
-n 定义字符数（限制变量值的长度）
-s 不显示（用户输入的内容）
-t 定义超时时间，默认单位为秒（限制用户输入变量的超时时间）

```

**举例说明：**
```
用法一：用户自己定义变量值
apple@appledeMacBook-Pro ~ % read name
harry

apple@appledeMacBook-Pro ~ % bash read -p "Input your name:" name
Input your name:gggg

apple@appledeMacBook-Pro ~ % bash read -s -p "Input your password"
Input your password%    

apple@appledeMacBook-Pro ~ % bash read  -n 5 -p "Input your name:" name
Input your name:12345%

apple@appledeMacBook-Pro ~ % bash read -t 3 -p "name:" name 
name:%

用法二：变量值来自文件

apple@appledeMacBook-Pro shell_test % read IP < ./ip.txt
apple@appledeMacBook-Pro shell_test % echo $IP              
10.1.1.1
```

4. 定义有类型的变量（declare）
**目的：** 给变量做一些限制，固定变量的类型，比如：整形、只读
**用法：** declare 选项 变量名=变量值
**常用选项：**

|选项|意思|例子|
|:-:|:-:|:-:|
| -i |将变量看成整形 | declare -i A=123 |
| -r |定义只读变量|declare -r B=hello|
| -a |定义普通数组、查看普通数组 |  |
| -A |定义关联数组、查看关联数组 |  |
| -x | 将变量通过环境导出 | declard -x AAA=123456 等于 export AAA=123456 |

**举例说明**

```
apple@appledeMacBook-Pro shell_test % declare -i A=123
apple@appledeMacBook-Pro shell_test % echo $A         
123

apple@appledeMacBook-Pro shell_test % declare -r B='hello world'
apple@appledeMacBook-Pro shell_test % echo $B
hello world

```

### 6. 变量的分类
1. 本地变量
> **本地变量：** 当前用户定义的变量。当前进程中有效，其他进程及进程的子进程无效。

2. 环境变量
> **环境变量：** 当前进程有效，并且能被子进程调用。

+ env查看当前用户的环境变量
+ set 查询当前用户的所有变量（临时变量与环境变量）
+ export 变量名=变量值 或者 变量名=变量值；export 变量名

3. 全局变量
1. **全局变量：** 全局所有的用户和程序都能调用，且继承，新建的用户也默认能调用
2. 解读相关配置文件

|文件名|说明|备注|
|:-:|:-:|:-:|
| $ HOME/.bashrc | 当前用户的bash信息，用户登录时读取 | 定义别名、umask、等函数 |
| $ HOME/.bash_profile | 当前用户的环境变量，用户登录时读取 |  |
| $ HOME/.bash_logout | 当前用户退出shell最后读取 | 定义用户退出时执行的程序等 |
| /et/bashrc  | 全局的bash信息，所用用户都生效 |  |
| /et/profile | 全局环境变量信息 | 系统和所有用户都生效 |
| $HOME/.bash_history |  |  |


**说明：**以上文件修改后，都需重新source让其生效或者退出重新登录。

3. 用户登录系统读取相关文件顺序
[1]. /etc/profile
[2]. $HOME/.bash_porfile
[3]. $HOME/.bashrc
[4]. etc/bashrc
[5]. $HOME/.bash_logout

4. 系统变量

1. 系统变量（内置bash中的变量）：shell本身已经固定好它的名字和作用。

| 内置变量 | 含义 |
| :-: | :-: |
| $? | 上一条命令执行后返回的状态；状态值为0表明执行正常，非0表示执行异常或错误 |
| $0 | 当前执行的程序或者脚本名 |
| $# | 脚本后面接的参数个数 |
| $* | 脚本后面所有参数，参数当成一个整体输出，每一个变量参数之间以空格隔开 |
| $@ | 脚本后面所有参数，参数是独立的，也是全部输出 |
| $1~$9 | 脚本后面的位置参数 ，$1表示第一个位置的参数 ，以此类推 |
| $$ | 当前所在进程的进程，如 echo $$ |
| $! | 后台运行的最后一个进程号（当前终端） |
| !$ | 调用最后一条命令历史的参数 |

2. 进一步了解位置参数$1~${n}

## 三、简单的四则运算
算术运算：默认情况下，shell也能支持简单的整数运算
运算内容：+（加）、-（减）、*（乘）、/（除）、%（余数）、**（次幂）

### 1. 四则运算符号

| 表达式 | 举例 |
| :-: | :-: |
| $(()) | echo $((1+1)) |
| $[] | echo $[10-5] |
| expr | echo 10 / 5 |
| let | n=1;let n+=1 等价于 let n=n+1 |

可以使用bc命令来做计算：
```
apple@appledeMBP ~ % bc
bc 1.06
Copyright 1991-1994, 1997, 1998, 2000 Free Software Foundation, Inc.
This is free software with ABSOLUTELY NO WARRANTY.
For details type `warranty'. 
3^3
27

```

### 2. 了解i++和++i

+ 对变量值的影响
```
apple@appledeMBP ~ % i=1
apple@appledeMBP ~ % let i++
apple@appledeMBP ~ % echo $i
2

apple@appledeMBP ~ % j=1
apple@appledeMBP ~ % let ++j
apple@appledeMBP ~ % echo $j
2
```
+ 对表达式的影响

```
apple@appledeMBP ~ % unset i j
apple@appledeMBP ~ % j=1;i=1
apple@appledeMBP ~ % let x=i++
apple@appledeMBP ~ % echo $x
1
apple@appledeMBP ~ % let y=++j
apple@appledeMBP ~ % echo $y
2

```

## 四、条件判断语法结构

**思考：何为真（true）？何为假（false）？**

### 1. 条件判断语法格式
+ 格式1:test 条件表达式
+ 格式2：[ 条件表达式 ]
+ 格式3：[[ 条件表达式 ]] 支持正则=~

**特别说明：**
+ 两边都有空格
+ 更多判断，man test 去查看，很多的参数都用来进行条件判断

### 2. 条件判断相关参数

问：你要判断什么？
答：我要判断文件类型、文件新旧、判断字符串是否相等、判断权限等等...

1. 判断文件类型
| 判断参数 | 含义 |
| :-: | :-: |
| -e | 判断文件是否存在（任何文件类型） |
| -f | 判断文件是否存在并且是一个普通文件 |
| -d | 判断文件是否存在并且是一个目录 |
| -L | 判断文件是否存在并且是一个软连接文件 |
| -b | 判断文件是否存在并且是一个块设备文件 |
| -S | 判断文件是否存在并且是一个套接字文件 |

**举例**

```
apple@appledeMBP shell_test % test -e 2.sh; echo $?
0

apple@appledeMBP shell_test % [ -d ./dir1 ];echo $?
0

apple@appledeMBP shell_test % [[ -f ./2.sh ]];echo $?
0

apple@appledeMBP shell_test % [ ! -d ./dir2 ];echo $? //感叹号取反
0

```

2. 判断文件权限

| 判断参数 | 含义 |
| :-: | :-: |
| -r | 当前用户对其是否可读 |
| -w | 当前用户对其是否可写 |
| -x | 当前用户对其是否可执行 |
| -u | 是否有suid，高级权限冒险位 |
| -k | 是否有t位，高级权限粘滞位 |

**举例：**

```
apple@appledeMBP shell_test % test -w 2.sh;echo $?
0

apple@appledeMBP shell_test % [ -r ./2.sh ];echo $?
0
```
3. 判断文件的新旧

说明；这里的新旧指的是文件的修改时间。
| 判断参数 | 含义 |
| :-: | :-: |
| file1 -nt file2 | 比价file1是否比file2新 |
| file1 -ot file2 | 比价文件file1是否比文件file2旧 |
| file1 -ef file2 | 比较是否为同一个文件，或者用于判断硬连接，是否指向同一个inode |

**举例**
```
apple@appledeMBP shell_test % test first.sh -nt first_1.sh;echo $?
1

apple@appledeMBP shell_test % [ ./first.sh -ef first_1.sh ];echo $?
1
```

4. 判断整数

| 判断参数 | 含义 |
| :-: | :-: |
| -eq | 相等 |
| -ne | 不等 |
| -eq | 相等 |
| -eq | 相等 |

5. 判断字符串

| 判断参数 | 含义 |
| :-: | :-: |
| -z | 判断是否为空字符串，字符串长度为零则成立 |
| -n | 判断是否为非空字符串，字符串长度不等于零则成立 |
| string1 = string2 | 判断是字符串是否相等 |
| string != string2 | 判断字符串是否不相等 |

6. 多重判断条件





