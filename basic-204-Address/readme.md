# Solidity基础教程:&nbsp;&nbsp;&nbsp;&nbsp;204.地址型 

本章学习 **`Solidity`** 数据类型中的地址型，以及地址型的相关运算。

**视频**：[Bilibili](https://www.bilibili.com/video/BV1cm4y177eW)  |  [Youtube](https://youtu.be/xvCcQ-fVRic)

<p align="center"><img src="./img/solidity-basic-v9.png" align="middle" /></p>

**官网**：[https://BinSchool.Org](https://binschool.org)

**代码**：[https://github.com/hitadao/solidity](https://github.com/hitadao/solidity)

**推特**：[@Hita_DAO](https://x.com/hita_dao)    **Discord**：[Hita_DAO](https://discord.gg/dzWY3QYGrx)

-----
**`地址型`** 是 **`Solidity`** 中常用的数据类型之一，用来存储以太坊中的账户地址。

它使用关键字 **`address`** 来声明。

**`地址型`** 变量的内部存储长度为 160 位，也就是 20 个字节，通常使用一个十六进制字符串来表示，并以前缀 **0x** 开头。

例如：

```solidity
address account = 0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db;
```

## 地址的生成原理

以太坊的账户地址是通过该账户的公钥，按照一定的算法计算得出的。

具体计算过程如下：

首先，将未压缩格式的公钥作为输入值，使用 **`keccak256`** 哈希算法，生成了一个 256 位的哈希值。

然后，截取 256 位哈希值右边的 160 位作为账户地址。

最后，为了便于显示，账户地址使用十六进制字符串来表示，这个字符串的长度为 40（ 1个字节由两个16进制字符来表示），并以前缀 **0x** 开头。

## 地址的比较运算

**`地址`** 可以进行比较运算，可以使用的操作符有：**==、!=、 <=、 <、>=、>**。

例如，判断两个地址是否相等：

```solidity
// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0; 

contract AddressCompare {
    address address1 = 0xB2D02Ac73b98DA8baF7B8FD5ACA31430Ec7D4429;
    address address2 = 0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db;
    
    function compareAddresses() public view returns (bool) {
        return (address1 == address2);
    }
}
```

## 地址的属性和方法

**`地址`** 具有 **.balance** 属性，用于返回该账户中以太坊的余额，这也是 **`地址`** 最常用的方法。例如：

```solidity
// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0; 

contract AddressBalance{ 
    address account = 0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db;

    function getBalance() public view returns(uint) {
        return account.balance;
    }
}
```

另外，**`地址`** 也经常用于转账，我们可以使用 **`地址`** 的 **.transfer()** 和 **.send()** 方法进行转账。

```solidity
// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0; 

contract AddressTransfer{ 
    address account = 0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db;

    function transferETH() public {
        payable(account).transfer(1 ether);
}
```

关于如何转账，以及 **.transfer()** 与 **.send()** 有什么区别，我们在后面的章节中再详细讲解。