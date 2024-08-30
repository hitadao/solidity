
# Solidity基础教程:&nbsp;&nbsp;&nbsp;&nbsp;804.调试和异常处理

本章学习 Solidity 代码如何调试，以及处理异常的常用方法。

**视频**：[Bilibili](https://space.bilibili.com/2112923943)  |  [Youtube](https://www.youtube.com/@BinSchoolApp)

**官网**：[BinSchoolOrg](https://binschool.org)

**代码**：[github.com/hitadao](https://github.com/hitadao)

**推特**：[@Hita_DAO](https://x.com/hita_dao)    **Discord**：[Hita_DAO](https://discord.gg/dzWY3QYGrx)

-----
使用 **`Solidity`** 编写智能合约，在开发过程中需要不断调试，以确保代码按照预设的逻辑执行，并能产生期望的结果。

在完成各个函数或模块之后，还需要进行单元测试和集成测试。充分的测试是非常必要的，可以避免上线后不必要损失。

## 1. 代码调试

在 **`Solidity`** 中，有几种常见的调试手段可以帮助开发者进行调试和排错：

### 1）打印日志

**`Solidity`** 中没有专门的打印日志的语句。但有一个变通的方法，就是使用 **`event`** 关键字来定义事件，并在合约中适当的位置触发事件，以输出相关变量的值。然后，通过查看日志，可以跟踪程序的执行路径和变量的值，帮助分析问题所在。

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Debug {
    event TransferLog(address); // 定义事件

    function transfer() public {
        // 调用事件
        emit TransferLog(msg.sender);
    }
}
```

我们把合约代码复制到 **`Remix`**，进行编译，并部署到区块链上：



 
点击调用函数 **`transfer`** 后，在右边下方的控制台中就输出调试信息，这也是在 **`Remix`** 中常用的调试方法之一。

### 2）使用断言

使用 **`assert`** 和 **`require`** 断言来检查条件是否满足。

通过在关键位置添加断言，可以验证假设和条件，确保代码执行到指定的位置，并检查变量值是否符合预期。断言失败时，合约将立即停止执行，并回滚所有状态变化。

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Assert {
  // 转账函数  
  function transfer(address to, uint256 amount) public pure {
    require(to != address(0), "address `to` is zero");
    // 执行转账操作
  }
}
```

转账函数 **`transfer`**，在调用的时候，需要首先检测接收地址 **`to`** 是否为0，如果为 0 ，就会输出日志：address `to` is zero"，终止转账。

所以，我们可以通过断言 **`require`** 输出的日志调试代码。关于断言的详细知识可以参考前面的章节。

### 3）使用 Remix 调试器

**`Remix`** 是一个基于Web的 **`Solidity`** 集成开发环境，它提供了一个内置的调试器。

使用 **`Remix`** 调试器，可以逐行调试合约代码，观察变量值的变化，并检查执行路径。

它还提供了断点设置、单步执行、查看堆栈等功能，方便进行调试和排错。



 
**`Remix`** 调试器并不是很友好，需要开发者非常熟悉 **`EVM`** 的 **`OpCode`**，以及了解一些汇编语言的知识。

非专业开发者，无需进行深入研究，有关知识将在以后的章节中详细讲解。

### 4) 使用测试框架

**`Solidity`** 的测试框架，例如 Truffle、Hardhat、Foundry，提供了一系列的工具和函数，用于编写和运行测试用例。

这些测试框架通常包含断言库和调试工具，可用于验证合约的预期行为，并帮助定位和修复问题。

有关 Truffle、Hardhat、Foundry 等测试框架的知识，我们会有单独的教程。

## 2. 异常处理
在 **`Solidity`** 中，异常是指在合约执行过程中出现的意外情况或错误情况。当某个条件不满足或发生错误时，可以触发异常。

比如：在合约中进行除法运算时，除数等于 0。

异常会导致合约在执行过程中，出现不可预测的结果，所以 ，我们必须进行对应的异常处理。

### 1) 内置异常处理

**`Solidity`** 提供了几种内置的预定义异常类型，用于在合约中处理特定的错误情况。这些预定义异常包括：

- assert 异常

当断言条件失败时触发，表示出现了不应该发生的情况。它会导致合约立即停止执行，并回滚所有状态更改。

- require 异常

当要求条件失败时触发，用于检查函数的前置条件。如果条件不满足，则会导致函数立即停止执行，并回滚所有状态更改。

- revert 异常

用于处理意外情况或未预料到的错误。当需要在异常情况下中止函数执行并回滚状态更改时，可以使用 **`revert`**。它允许合约返回一个错误消息，以向调用者提供有关异常的信息。

那么如何使用 **`revert`** 呢？

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Assert {
  // 转账函数  
  function transfer(address to, uint256 amount) public pure {
    if(to == address(0)) {
       revert("address `to` is zero"); // 回滚交易，返回错误信息
    }
    // 执行转账操作
  }
}
```

**`revert`** 会终止代码的执行，回滚交易，并返回错误信息。

2. try...catch 机制

**`Solidity`** 默认的异常处理机制是一旦发生异常，当前交易会被终止，合约状态也会被回滚。

但有时候我们并不想这样简单处理，要是能够捕获异常，然后根据情况自行处理不是更好吗？所以，这种场景下就适应于使用 try...catch 语句。

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Exception {
    function divide(uint256 a, uint256 b) external view returns (uint256) {
        try this.divideInternal(a, b) returns (uint256 result) {
            // 成功执行，返回计算结果
            return result;
        } catch Error(string memory errorMessage) {
            // 处理用户定义的异常
            revert(errorMessage);
        } catch {
            // 处理未预料到的异常
            revert("Unknown error occurred");
        }
    }

    function divideInternal(uint256 a, uint256 b) external pure returns (uint256) {
        if (b == 0) {
            // 抛出用户定义的异常
            revert("Division by zero");
        }
        return a / b;
    }
}
```

在 **`Solidity`** 中，**`try`** 语句只能用于外部函数调用和合约创建调用，不能用于内部函数调用。内部函数的调用只能使用断言语句。

**`try`** 语句在实际的智能合约中并不常用，我们只需了解即可。