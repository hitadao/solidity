# Solidity基础教程:&nbsp;&nbsp;&nbsp;&nbsp;602.字符串

本章学习 **`Solidity`** 字节和字符串的定义语法和使用方法。

**视频**：[Bilibili](https://space.bilibili.com/2112923943)  |  [Youtube](https://www.youtube.com/@BinSchoolApp)

**官网**：[https://BinSchool.Org](https://binschool.org)

**代码**：[https://github.com/hitadao/solidity](https://github.com/hitadao/solidity)

**推特**：[@Hita_DAO](https://x.com/hita_dao)    **Discord**：[Hita_DAO](https://discord.gg/dzWY3QYGrx)

-----
在学习字符串之前，我们首先要掌握 **`字节型`**，它也是 **`Solidity`** 中重要的一种数据类型。

**`字节型`** 用于表示特定长度的字节序列，分为 **`固定长度字节型`** 和 **`动态长度字节型`** 两种类型。

**`字节型`** 本质上就是一个字节数组，**`Solidity`** 为了使用方便，把它单独定义为一种数据类型。

## 1. 固定长度字节型

**`固定长度字节型`** 又按照长度分为 32 种小类，使用 bytes1、bytes2、bytes3 直到 bytes32 表示，每种类型代表不同长度的字节序列。

**`固定长度字节型`** 的变量声明如下：

```solidity
bytes1 myBytes1 = 0x12;  // 单个字节
bytes2 myBytes2 = 0x1234;  // 两个字节
bytes32 myBytes32 = 0x1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef; // 32个字节
```

对于 **`固定长度字节型`** 的变量的使用方法，与 **`固定长度字节型`** 基本相同。

我们使用下面的智能合约作为范例，来展示其用法。

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StaticBytes {

    function staticBytes() external pure
        returns (uint256, bytes2, bytes1)
    {
        bytes2 myBytes = 0x1212; // 声明固定长度字节型变量
        bytes1 b = myBytes[0]; // 读取单个字节的值
        myBytes = 0x3456; // 设置整个字节型变量的值
        // myBytes[0] = 0x78; // 不允许设置单个字节的值
        return (myBytes.length, myBytes, b);
    }
}
```

## 2. 动态长度字节型

**`动态长度字节型`** 可以存储任意长度的字节序列，它使用关键字 **`bytes`** 来声明，在声明变量时，需要指定其长度或初始化值。

**`动态长度字节型`** 的变量声明如下：

```solidity
bytes myBytes = new bytes(10);  // 声明一个长度为 10 的动态长度字节变量
bytes myBytes = "Hello";  // 声明一个动态长度字节变量，并初始化为 "Hello"
bytes myBytes = hex"1234";  // 声明一个动态长度字节变量，并初始化为十六进制 0x1234
```

对于 **`动态长度字节型`** 的变量的使用方法，与 **`动态长度数组`** 基本相同。

我们使用下面的智能合约作为范例，来展示其用法。

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DynamicBytes {

    function dynamicBytes() external pure
        returns (uint256, bytes memory)
    {
        bytes memory myBytes = new bytes(2); // 创建动态长度字节型变量
        myBytes[0] = 0x12; // 设置单个字节的值
        myBytes[1] = 0x34; 
        return (myBytes.length, myBytes);
    }
}
```

## 3. 字符串

在 **`Solidity`** 中，字符串是用来存储文本数据的类型。

字符串值使用双引号 (") 或单引号 (') 包裹，字符串类型用 **`string`** 表示。

```solidity
string public myString = "Hello World";
```

字符串与固定长度的字节数组非常类似，它的值在声明之后就不可变了。

如果想要对字符串中包含的字符进行操作，通常会将它转换为 **`bytes`** 类型。

**`Solidity`** 提供了字节数组 **`bytes`** 与字符串 **`string`** 之间的内置转换。

### 3.1 bytes 转换 string

可以使用 string() 函数将 **`bytes`** 显式转换为字符串 **`string`**。

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StringConvertor {

    function bytesToString() external pure
        returns (string memory)
    {
        bytes memory myBytes = new bytes(2);
        myBytes[0] = 'o';
        myBytes[1] = 'k';
        return string(myBytes); // 返回字符串 ok
    }
}
```

运行上述合约，调用 **bytesToString** 函数后，返回字符串 "ok"。

### 3.2 string 转换 bytes

可以使用 bytes() 函数将 **`string`** 显式转换为字节数组 **`bytes`**。

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BytesConvertor {

    function stringToBytes() external pure
        returns (bytes memory)
    {
        string memory myString = "Hello World";
        return bytes(myString); // 返回字节数组
    }
}
```

运行上述合约，调用 **stringToBytes** 函数后，返回字节数组 "0x48656c6c6f20576f726c64"。

### 3.3 获得字符串长度

字符串并没有直接获得长度的函数，需要先转换为 **`bytes`**，再求其长度。

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StringLen {
    function len() external pure returns (uint) {
        string memory myString = "Hello World";
        return bytes(myString).length; 
    }
}
```

### 3.4 支持 unicode 编码

如果字符串中含有 **`unicode`** 编码的字符，比如表情符号或者中文，那么就需要在赋值的时候进行声明，否则会报错。

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StringUnicode {
    function greet() external pure returns (string memory) {
        return unicode"Hello 王泽宾";
    }
}
```