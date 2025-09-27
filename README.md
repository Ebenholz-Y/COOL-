# COOL-
这是一个使用 COOL (Classroom Object-Oriented Language) 语言实现的栈数据结构项目。  ## 项目描述  本项目实现了栈（Stack）数据结构，支持以下操作： - `push(item: Int)` - 压栈操作 - `pop(): Int` - 弹栈操作   - `peek(): Int` - 查看栈顶元素 - `is_empty(): Bool` - 检查栈是否为空 - `size(): Int` - 获取栈大小 - `display(): Object` - 显示栈内容
## 文件结构
cool-stack-implementation/
├── README.md # 项目说明文档
├── stack.cl # 栈实现源代码
├── test_stack.cl # 测试代码
├── run_example.sh # 运行示例脚本
└── output_example.txt # 示例输出结果

text

## 运行方法

### 前提条件
- 已安装 COOL 语言编译器 (`coolc`)
- 已安装 SPIM 模拟器 (`spim`)

### 编译和运行

1. **编译 COOL 程序**:
   ```bash
   coolc stack.cl
运行程序:

bash
spim stack.s
使用提供的脚本运行
bash
# 给脚本添加执行权限
chmod +x run_example.sh

# 运行脚本
./run_example.sh
代码结构
主要类
StackNode - 栈节点类

data: Int - 存储的数据

next: StackNode - 指向下一节点的指针

Stack - 栈主类

实现了完整的栈操作接口

使用链表结构实现，支持动态大小

Main - 测试主类

包含完整的测试用例

演示栈的各种操作和边界条件

测试用例
测试包括：

基本压栈/弹栈操作

边界条件测试（空栈操作）

连续操作测试

链式调用测试

示例输出
text
=== 栈数据结构实验测试 ===

1. 基本操作测试:
Pushed: 10
Pushed: 20
Pushed: 30
Stack contents (top to bottom): 30 20 10
栈顶元素: 30
Popped: 30
Stack contents (top to bottom): 20 10
当前大小: 2

...（完整输出见 output_example.txt）
作者
[你的姓名] - [你的学号]

许可证
本项目仅用于教学目的。
