## CS334 Lab2 report

#### SID: 12012919

#### Name: 廖铭骞

#### 编写c代码存在Q1.c中(截图)，代码中使用math库中的sqrt函数，对2进行开方，并打印结果。用gcc命令生成可执行文件Q1并执行(截图)

Q1.c 程序截图：

<img src="C:\Users\86181\AppData\Roaming\Typora\typora-user-images\image-20220629142033531.png" alt="image-20220629142033531" style="zoom: 50%;" />



GCC 执行截图：

![image-20220629142104311](C:\Users\86181\AppData\Roaming\Typora\typora-user-images\image-20220629142104311.png)



#### 编写c代码存在Q2.c中,请实现一个可以打印自己姓名和学号的C语言程序(截图)。用gcc生成目标文件Q2.o，然后生成可执行文件Q2并执行。用file命令查看文件类型(截图)

Q2.c 程序截图：

<img src="C:\Users\86181\AppData\Roaming\Typora\typora-user-images\image-20220629142356842.png" alt="image-20220629142356842" style="zoom:50%;" />

操作截图：

<img src="C:\Users\86181\AppData\Roaming\Typora\typora-user-images\image-20220629142525424.png" alt="image-20220629142525424" style="zoom:50%;" />

#### 请总结C语言的编译过程

先是经过预处理（展开所有的头文件，进行对应的宏替换等等操作）；之后进行编译，生成汇编程序；之后进入汇编过程，将汇编代码转换成为机器码；最后进行链接，将所有目标文件和库文件结合在一起，成为可执行文件。

#### windows和ubuntu下的可执行文件的格式分别是什么？

在 Windows 下可执行文件的格式一般为PE，而在 Ubuntu下可执行文件的格式为ELF。

#### 请编写makefile文件(截图)，执行make命令或者执行make file1时通过Q1打印2的开方结果(截图)，执行make file2时通过Q2打印自己的姓名学号(截图)

Makefile 文件截图：

<img src="C:\Users\86181\AppData\Roaming\Typora\typora-user-images\image-20220629150908640.png" alt="image-20220629150908640" style="zoom:50%;" />

运行 make file1执行 Q1(开方)

以及

运行 make file2执行 Q2（显示姓名学号）：

![image-20220629150839285](C:\Users\86181\AppData\Roaming\Typora\typora-user-images\image-20220629150839285.png)

#### 给定宏定义 #define SUM(x) (x)+(x) , SUM(5*3) * SUM(5*3)的计算结果是什么

字符替换之后等于：

`5*3+5*3 * 5*3+5*3 = 255`

所以结果是 255