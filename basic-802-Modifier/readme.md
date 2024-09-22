# Solidity基础教程:&nbsp;&nbsp;&nbsp;&nbsp;802.修饰器 modifier

本章学习修饰器的定义和使用方法。

**视频**：[Bilibili](https://space.bilibili.com/2112923943)  |  [Youtube](https://www.youtube.com/@BinSchoolApp)

**官网**：[https://BinSchool.Org](https://binschool.org)

**代码**：[https://github.com/hitadao/solidity](https://github.com/hitadao/solidity)

**推特**：[@Hita_DAO](https://x.com/hita_dao)    **Discord**：[Hita_DAO](https://discord.gg/dzWY3QYGrx)

-----
在 **`Solidity`** 中，修饰器是一种用于修改函数行为的语法结构。当修饰器作用于一个函数上，可以在该函数执行前或后执行修饰器中的逻辑，以增强其功能。

修饰器可以用于验证输入参数、执行权限检查、记录日志等操作。通过使用修饰器，可以在不改变函数本身逻辑的情况下，对函数进行重用和扩展。

## 1. 语法

**`Solidity`** 使用关键字 modifier 声明一个函数修饰器，语法如下：

```solidity
modifier modifier-name(parameter1, parameter2, ...) {
    // 在函数执行前执行的逻辑
    _; // 执行被修饰的函数
    // 在函数执行后执行的逻辑
}
```

修饰器语法中包含以下部分：

- **modifier**

关键字，用于声明一个修饰器。

- **modifier-name**

修饰器的名称，可以根据需求自定义。

- **(parameter1, parameter2, ...)**

可选的修饰器参数列表，用于传递参数给修饰器。

- **修饰器逻辑**

在被修饰函数执行之前和之后执行的逻辑。

- **特殊符号 _**

_ 表示被修饰函数的执行位置。

## 2. 使用方法

修饰器使用非常普遍，可以用于验证输入参数、执行权限检查、记录日志等操作。

比如，在一个智能合约中，某些函数只能由合约部署者使用，而普通用户则没有权限使用。这里的合约部署者类似于系统管理员，他在系统中具有更大的权力。

下面，我们通过例子展示修饰器的使用方法：

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Modifier {
  address owner; // 合约部署者地址
  mapping (address => bool) blacklist; // 账户黑名单

  modifier onlyOwner() {
    require(msg.sender == owner, "Only owner can call this function");
    _; // 执行被修饰的函数
  }

  // 构造函数，保存合约部署者地址
  constructor() {
    owner = msg.sender;
  }

  // 将某地址加入黑名单，只有合约部署者有权调用
  function setBlacklist(address account) onlyOwner external{
    blacklist[account] = true;
  }

  // 查看某地址是否在黑名单中
  function isBlacklist(address account) external view returns (bool) {
    return blacklist[account];
  }
}
```

**`onlyOwner`** 是一个函数修改器，它用来判断调用者是否为合约的部署者，如果是合约的部署者，就继续执行它所修饰的函数，如果不是就回滚交易，并返回错误信息“Only owner can call this function”。

**`setBlacklist`** 用于将某地址加入黑名单。这个函数被修饰器 **`onlyOwner`** 修饰，所以它只能由合约部署者调用，其它账户是无法调用这个函数的。

**`isBlacklist`** 用于查看某地址是否在黑名单中。由于这个函数的声明中没有修饰器，所以它可以被任何人调用。

凡是合约中只能由合约部署者调用的函数，我们都可以在函数声明使用 修饰器 **`onlyOwner`** 修饰，极大简化了权限控制的代码编写。所以，我们可以将合约中一些通用的操作提取出来，包装为函数修饰器，来提高代码的复用性，改善编码效率。

我们对比一下下面两段代码的区别：

```solidity
  modifier onlyOwner() {
    require(msg.sender == owner, "Only owner can call this function");
    _; // 继续执行被修饰的函数
  }
  modifier onlyOwner() {
    _; // 先执行被修饰的函数
    require(msg.sender == owner, "Only owner can call this function");
  }
```

前者是先判断条件，然后再执行被修饰的函数；后者是先执行被修饰的函数，再判断条件。其中的 _; 表示被修饰函数的执行位置。

## 3. 带参数的修饰器

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ModifierParameter {
  int public counter; 

  modifier isPositive(int x) {
    // 判断 x 是否大于 0，如果大于 0，就继续执行，否则终止执行
    require(x > 0, "x has to be greater than 0"); 
     _; // 执行修饰的函数
  }

   function add(int x) external isPositive(x) {
      counter += x; 
   }
}
```

修饰器 **`isPositive`** 用来判断输入参数是否大于 0，如果大于 0，就继续执行，否则终止执行。这里的修饰器 **`isPositive`** 带有一个参数 x，由被修饰的函数传入。

修饰器在智能合约中使用非常普遍，我们必须熟练掌握。

