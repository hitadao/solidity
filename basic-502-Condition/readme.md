# Solidity基础教程:&nbsp;&nbsp;&nbsp;&nbsp;502.条件语句

本章学习 **`Solidity`** 中的条件语句。

**视频**：[Bilibili](https://www.bilibili.com/video/BV1Ub4y1u7hM)  |  [Youtube](https://youtu.be/G24EPHMrTy8)

**官网**：[BinSchoolOrg](https://binschool.org)

**代码**：[github.com/hitadao](https://github.com/hitadao)

**推特**：[@Hita_DAO](https://x.com/hita_dao)    **Discord**：[Hita_DAO](https://discord.gg/dzWY3QYGrx)

-----
**`Solidity`** 提供了条件语句，用于根据给定的条件来执行特定的代码块。

它的作用是根据条件的真假决定程序的执行路径，从而实现控制程序的执行流程。

**`Solidity`** 支持三种条件语句：if 语句、if...else语句、if...else if语句。

## 1. if 语句

if 语句的语法如下：

```solidity
if (condition) {
    // 如果条件 condition 为 true，执行这里的代码
}
```

这里的 **`condition`** 是一个布尔表达式或条件，如果条件为真，则执行 **`if`** 代码块中的代码；否则直接跳过这段代码。

以下的智能合约展示了 **`if`** 语句的用法：

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ConditionIf {
  
  // 转账函数 
  function transfer(uint256 amount) public pure returns(bool) {
    if (amount == 0) {
      // 如果转账金额 amount 等于 0，返回 false
      return false; 
    }
    // 如果转账金额 amount 大于 0，继续向下执行
    // ......
    return true;
  }
}
```

在上面合约的 **`transfer`** 函数中，如果传入的参数 **`amount`** 等于 0，那么就会进入 **`if`** 语句块，直接返回 false。

如果参数 **`amount`** 大于 0，那么就会跳过 **`if`** 语句块，执行后续操作。

## 2. if...else 语句

**if...else** 语句的语法如下：

```solidity
if (condition) {
    // 如果条件 condition 为 true，执行这里的代码
} else {
    // 如果条件 condition 为 false，就执行这里的代码
}
```

这里的 **`condition`** 是一个布尔表达式或条件，如果条件为真，则执行 **`if`** 代码块中的代码；如果条件为假，则执行 **`else`** 代码块中的代码。

以下的智能合约展示了 **if...else** 语句的用法：

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ConditionIfElse {

  // 转账函数 
  function transfer(uint256 amount) public pure returns(bool) {
    if (amount == 0) {
      // 如果转账金额 amount 等于 0，返回 false
      return false; 
    } else {
      // 如果转账金额 amount 大于 0，执行代码后，返回 true
      // ......
      return true;
   }
  }
}
```

在上面合约的 **`transfer`** 函数中，如果传入的参数 **`amount`** 等于 0，那么就会进入 **`if`** 语句块，返回 false。

如果参数 **`amount`** 大于 0，那么就进入 **`else`** 语句块，执行后续操作，最后返回 true。

## 3. if…else if… 语句

**if…else if** 语句的语法如下：

```solidity
if (condition1) {
    // 如果条件 condition1 为 true，执行这里的代码
} else if (condition2) {
    // 如果条件 condition1 为 false，条件 condition2 为 true，就执行这里的代码
} else {
    // 如果以上条件全部不满足，就执行这里的代码
}
```

以下的智能合约展示了 **if...else if** 语句的用法：

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ConditionIfElseIf {

  // 根据输入参数 status 的值，返回对应的数量
  function getCount(uint256 status) public pure returns(uint256) {
    if (status == 1) {
      // 如果 status 等于 1，返回 100
      return 100; 
    } else if (status == 2) {
      // 如果 status 等于 2，返回 200
      return 200;
     } else {
      // 如果 status 不等于 1 或 2，返回 0
      return 0;
   }
  }
}
```

**`Solidity`** 目前并不直接支持其它语言中的 **`switch`** 语句。对于多重条件的选择，只能使用 **if…else if…**  结构来替代。