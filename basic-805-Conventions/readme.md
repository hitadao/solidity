# Solidity基础教程:&nbsp;&nbsp;&nbsp;&nbsp;805.编程规范

本章学习 Solidity 编程规范，掌握编写智能合约代码的通用规则。

**视频**：[Bilibili](https://space.bilibili.com/2112923943)  |  [Youtube](https://www.youtube.com/@BinSchoolApp)

**官网**：[https://BinSchool.Org](https://binschool.org)

**代码**：[https://github.com/hitadao/solidity](https://github.com/hitadao/solidity)

**推特**：[@Hita_DAO](https://x.com/hita_dao)    **Discord**：[Hita_DAO](https://discord.gg/dzWY3QYGrx)

-----
编程规范又叫代码规范，就是为了方便自己和他人阅读和理解源程序，而制定的编程时必须遵守的约定。Solidity 有自己特有的编程规范。

编程规范只是一个规范，可以遵守，也可以不遵守，但是要成为一个有良好编程风格的开发者，还是需要遵守编程规范的，这不仅方便自己阅读源程序，也方便与其它开发者进行交流。良好统一的编程风格，有助于提高代码的可读性和可维护性。

下面是关于 **`Solidity`** 编程风格的建议。

## 1. 代码组成顺序

代码中各部分的组成顺序如下：

- pragma 语句

- import 语句

- interface

- library

- contract

在 interface、library 或 contract 中，各组成部分顺序如下：

- 类型声明(enum，struct)

- 状态变量

- 事件

- 函数

## 2. 命名约定

- 合约和库应该使用驼峰式命名。

例如: SmartContract, Owner。

合约和库名应该匹配它们的文件名。

如果文件中有多个合约/库，应该使用核心合约/库的名称。

例如，Owned.sol 文件：

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Owned {
    address public owner;

    constructor() public {
      owner = msg.sender;
    }

    modifier onlyOwner {
        //....
    }

    function transferOwnership(address newOwner) public onlyOwner {
        //....
    }
}
```

- 结构体名称

驼峰式命名，例如: MyCoin。

- 事件名称

驼峰式命名，例如：AfterTransfer。

- 函数名

驼峰式命名，首字母小写，例如：initiateSupply。

- 局部变量和状态变量

驼峰式命名，首字母小写，例如：creatorAddress、supply。

- 常量

大写字母单词用下划线分隔，例如：MAX_BLOCKS。

- 修饰符的名字

驼峰式命名，首字母小写，例如：onlyAfter。

- 枚举的名字

驼峰式命名，例如：TokenGroup。

## 3. 代码布局

- 缩进

使用4个空格代替制表符作为缩进，避免空格与制表符混用。

- 空2行规则

2个合约定义之间空2行。

```solidity
contract LedgerBalance {
    //...
}


contract Updater {
    //...
}
```

- 空1行规则

2个函数之间空1行。在只有声明的情况下，不需要空行。

```solidity
contract A {
    function balance() public pure;
    function account() public pure;
}

contract B is A {
    function balance() public pure {
        // ...
    }

    function account() public pure {
        // ...
    }
}
```

- 行长度

一行不超过79个字符。

- 换行规则

函数声明中左括号不换行，每个参数一行并缩进，右括号换行，并对齐左括号所在行。

```solidity
function_with_a_long_name(
    longArgument1,
    longArgument2,
    longArgument3
);

variable = function_with_a_long_name(
    longArgument1,
    longArgument2,
    longArgument3
);

event multipleArguments(
    address sender,
    address recipient,
    uint256 publicKey,
    uint256 amount,
    bytes32[] options
);

MultipleArguments(
    sender,
    recipient,
    publicKey,
    amount,
    options
);
```

- 源码编码

UTF-8。

- import

import 语句应该放在文件的顶部，pragma 声明之后。

- 函数顺序

函数应该根据它们的可见性来分组。

```solidity
contract A {
    constructor() public {
        // ...
    }

    // external functions
    // ...

    // external view functions
    // ...

    // external pure functions
    // ...

    // public functions
    // ...

    // internal functions
    // ...

    // private functions
    // ...
}
```

-避免多余空格

避免在圆括号、方括号或大括号后有空格。

-控制结构

大括号的左括号不换行，右括号换行，与左括号所在行对齐。

```solidity
contract Coin {
    struct Bank {
        address owner;
        uint balance;
    }
}

if (x < 3) {
    x += 1;
} else if (x > 7) {
    x -= 1;
} else {
    x = 5;
}
if (x < 3)
    x += 1;
else 
    x -= 1;

```

- 函数声明

使用上面的大括号规则。添加可见性标签。可见性标签应该放在自定义修饰符之前。

```solidity
function kill() public onlyOwner {
    selfdestruct(owner);
}
```

- 映射

在声明映射变量时避免多余空格。

```solidity
mapping(uint => uint) map; // 不是 mapping (uint => uint) map; 
mapping(address => bool) registeredAddresses;
mapping(uint => mapping(bool => Data[])) public data;
mapping(uint => mapping(uint => s)) data;
```

- 变量声明

声明数组变量时避免多余空格。

```solidity
uint[] x;  // 不是 unit [] x;
```

- 字符串声明

使用双引号声明字符串，而不是单引号。

```solidity
str = "foo";
str = "Hamlet says, 'To be or not to be...'";
```