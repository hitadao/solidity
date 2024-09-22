# Solidity基础教程:&nbsp;&nbsp;&nbsp;&nbsp;104.注释语句 

本章学习 **`Solidity`** 智能合约中的注释语句。

**视频**：[Bilibili](https://www.bilibili.com/video/BV19N41127Pk)  |  [Youtube](https://youtu.be/cvLogvkVg5g)

<p align="center"><img src="./img/solidity-basic-v4.png" align="middle" /></p>

**官网**：[https://BinSchool.Org](https://binschool.org)

**代码**：[https://github.com/hitadao/solidity](https://github.com/hitadao/solidity)

**推特**：[@Hita_DAO](https://x.com/hita_dao)    **Discord**：[Hita_DAO](https://discord.gg/dzWY3QYGrx)

-----
注释语句是指在 **`Solidity`** 源代码中添加的注释文本，用于解释代码的含义、目的和用法等信息。

注释语句是不会被执行的，它在编译过程中就会被忽略掉。所以，我们去除智能合约中的注释语句，是完全不会影响合约功能的。

我们在程序代码中添加必要的注释，可以提高代码的可读性，便于自己日后阅读，或者方便它人使用代码。

通常情况下，无论使用哪种编程语言，注释都被视为良好的编程实践，尤其是在团队协作的环境中。当然，并不是注释得越多越好，要掌握好“度”，因为它会增加开发者的工作量，影响阅读者思路的连贯性。

## 注释方式

在 **`Solidity`** 中，有三种常见的注释方式：

### 1. 单行注释

以双斜杠 **//** 开头的注释表示为单行注释。单行注释只能在同一行中使用，而且只对一行有效。例如：

```solidity
// 这是一个单行注释
```

另外，使用 // 的单行注释，除了自己可以是单独的一行，还可以添加在任何一行的末尾。例如：

```solidity
uint256 account = 100; // 金额
```

### 2. 多行注释

以斜杠和星号 /* */ 包裹的注释表示多行注释，它可以跨越多行。例如：

```solidity
/*
这是一个
多行注释
可以跨越多行
*/
```

### 3. NATSpec 格式

NATSpec 格式，也就是以太坊自然语言规范格式，这是 **`Solidity`** 社区推荐的注释方式。

NATSpec 格式使用 /// 加上标签的注释方法，进行单行注释。使用 /**... */ 进行多行注释。

这种注释方式的好处是输入时比较方便，视觉效果更整洁，最重要的是，它能够配合 注释标签 与其它开发工具进行集成。

例如：

```solidity
/// @title 计算器合约
/// @author 作者
/// @notice 这是功能描述
/// @dev 这里是实现细节
contract Calculator {

  /// @dev 乘法计算
  /// @param a  乘数
  /// @param b  被乘数
  /// @return c 计算结果
  function multiply(uint a, uint b) public pure returns(uint) {
    return a * b; 
  } 
}
```

## 注释标签

在 **`Solidity`** 中，注释标签是一种特殊的注释。这些注释标签以 **“@”** 符号开头，并在后面跟着标签名称和标签值。

```solidity
/// @title 计算器合约
/// @author 作者
/// @notice 这是功能描述
/// @dev 这里是实现细节
contract Calculator {

}
```

其中的 title、author、notice、dev 就是注释标签。通过这些注释标签，我们就可以知道合约的用途、作者、功能以及实现细节。

简单来说，注释标签是一种约定俗成的注释，开发者们对注释的含义达成共识，都愿意用约定的标签来代表特定的含义。

## 使用注释标签到底有什么好处呢？

注释标签具有约定俗称的含义，可以提高代码的可读性。
许多 **`Solidity`** 集成开发环境和文档生成工具都支持注释标签，可以通过它们方便地生成文档，并进行代码导航。
以下是一些常用的注释标签：

| Tag	| 用途 | 适用对象|
|:----|:-----|:------|
| @title|	描述合约的标题|	contract, interface|
| @author| 描述作者姓名|	contract, interface, function|
| @notice| 描述合约或者函数的功能|	contract, interface, function|
| @dev|	提供给开发人员的实现细节|	contract, interface, function|
| @param|	提供函数参数说明|	function|
| @return| 提供函数返回值说明|	function|

## 选择何种注释方式

在 **`Solidity`** 中，采用哪一种注释方式，完全可以由自己的喜好决定，无需刻意为之。

其实，许多知名的开源项目也都采用了不同的注释方式，例如：

**`UniSwap`** 使用的是 **`NATSpec`** 格式的注释：

```solidity
/// @title Canonical Uniswap V3 factory
/// @notice Deploys Uniswap V3 pools and manages ownership
contract UniswapV3Factory is IUniswapV3Factory, UniswapV3PoolDeployer, NoDelegateCall {

}
```

**`OpenZeppelin`** 使用的是传统方式的注释：

```solidity
 /**
 * @dev Implementation of the {IERC20} interface.
 *
 * This implementation is agnostic to the way tokens are created. This means
 * that a supply mechanism has to be added in a derived contract using {_mint}. 
 * For a generic mechanism see {ERC20PresetMinterPauser}.
 *
 **/
 contract ERC20 is Context, IERC20, IERC20Metadata {

 }
```

如果一个团队进行协作开发，保持一致的注释风格是非常重要的，因为它可以节省沟通成本，并能提高团队的协作效率。
