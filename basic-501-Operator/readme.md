# Solidity基础教程:&nbsp;&nbsp;&nbsp;&nbsp;501.运算符

本章学习 **`Solidity`** 中的运算符。

**视频**：[Bilibili](https://www.bilibili.com/video/BV1Q84y197sr)  |  [Youtube](https://youtu.be/WhKrXQnBNQo)

<p align="center"><img src="./img/solidity-basic-v20.png" align="middle" /></p>

**官网**：[BinSchoolOrg](https://binschool.org)

**代码**：[github.com/hitadao](https://github.com/hitadao)

**推特**：[@Hita_DAO](https://x.com/hita_dao)    **Discord**：[Hita_DAO](https://discord.gg/dzWY3QYGrx)

-----
**`Solidity`** 支持多种运算符，用于对变量和表达式执行数学计算、条件判断、位操作和赋值等操作。

**`Solidity`** 支持的运算法包括 6 类：算术运算符、比较运算符、逻辑运算符、位运算符、赋值运算符、条件运算符。

其中，算术运算符、比较运算符、逻辑运算符最为常用，需要熟练掌握。

## 1. 算术运算符

算术运算符用于执行基本的数学运算，对数字进行加法、减法、乘法和除法等操作。

假设变量 A 的值为 10，变量 B 的值为 20，那么执行算术运算后的结果如下表。

|序号	|运算符与描述|
|:---|:---|
|1|	+ (加)   两数相加，例如: A + B = 30|
|2|	- (减)   两数相减，例如: A - B = -10|
|3|	* (乘)   两数相乘，例如: A * B = 200|
|4|	/ (除)   两数相除，例如: B / A = 2|
|5|	% (取模)   取余数运算，例如: B % A = 0|
|6|	++ (递增)   递增运算，例如: A++ = 11，等同于 A+1 = 11|
|7|	-- (递减)   递减运算，例如: A--= 9，等同于 A-1 = 9|

下面的代码展示了如何使用算术运算符：

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OperatorMaths {
  int a = 10;
  int b = 20;

  function add() public view returns(int){ 
    return a+b; // 结果为 30
  } 
  function sub() public view returns(int){ 
    return a-b; // 结果为 -10
  } 
  function mul() public view returns(int){ 
    return a*b; // 结果为 200
  }
  function div() public view returns(int){ 
    return a/b; // 结果为 0
  } 
  function mod() public view returns(int){ 
    return a%b; // 结果为 10
  }
  function increase() public returns(int){ 
    a++;
    return a; // 结果为 11
  }
  function decrease() public returns(int){ 
    a--;
    return a; // 结果为 9
  }  
}
```

## 2. 比较运算符

比较运算符用于比较两个值之间的关系，并返回一个布尔值。

假设变量 A 的值为 10，变量 B 的值为 20，那么执行比较运算后的结果如下表。

|序号	|运算符与描述|
|:---|:---|
|1|	== (等于)   例如: A == B，结果为 false|
|2|	!= (不等于)   例如: A != B，结果为 true|
|3|	> (大于)   例如: A > B，结果为 false|
|4|	< (小于)   例如: A < B，结果为 true|
|5|	>= (大于等于)   例如: A > B，结果为 false|
|6|	<= (小于等于)   例如: A <= B，结果为 true|


下面的代码展示了如何使用比较运算符：

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OperatorCompare {
  int a = 10;
  int b = 20;

  function equal() public view returns(bool){ 
    return a==b; // 结果为 false
  } 
  function notEqual() public view returns(bool){ 
    return a!=b; // 结果为 true
  } 
  function greater() public view returns(bool){ 
    return a>b; // 结果为 false
  }
  function less() public view returns(bool){ 
    return a<b; // 结果为 true
  } 
  function greaterOrEqual() public view returns(bool){ 
    return a>=b;  // 结果为 false
  }
  function lessOrEqual() public view returns(bool){ 
    return a<=b;  // 结果为 true
  } 
}
```

## 3. 逻辑运算符

逻辑运算符用于在条件表达式组合和操作布尔值。

逻辑运算符经常用于条件语句、循环语句和布尔表达式中，通过逻辑关系决定执行路径，来实现复杂的流程控制。

假设变量 A 的值为 true，变量 B 的值为 false，那么执行比较运算后的结果如下表。

|序号	|运算符与描述|
|:---|:---|
|1|	&& (逻辑与)  如果两个操作数都为 true，则返回 true；否则返回 false。  例如: (A && B) 为 false。|
|2|	\|\| (逻辑或)  如果至少一个操作数为 true，则返回 true；否则返回 false。  例如: (A \|\| B) 为 true。|
|3|	! (逻辑非)  将布尔值取反，如果操作数为true，则返回false；如果操作数为false，则返回true。  例如: !A 为 false。|

下面的代码展示了如何使用逻辑运算符：

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OperatorLogic {
  bool a = true;
  bool b = false;

  function and() public view returns(bool){ 
    return a&&b; // 结果为 false
  } 
  function or() public view returns(bool){ 
    return a||b; // 结果为 true
  } 
  function not() public view returns(bool){ 
    return !a; // 结果为 false
  }
}
```

## 4. 位运算符

**`Solidity`** 支持多种位运算符，但位运算符在实际的使用场景并不多，我们可以大体了解一下，以后用到再去深入学习。

假设变量 A 的值为 2，变量 B 的值为 3，那么执行位运算后的结果如下表。

|序号	|运算符与描述|
|:---|:---|
|1|	& (位与)  对其整数参数的每个位执行位与操作。  例如: (A & B) 为 2。|
|2|	\| (位或)  对其整数参数的每个位执行位或操作。  例如: (A \| B) 为 3。|
|3|	^ (位异或)  对其整数参数的每个位执行位异或操作。  例如: (A ^ B) 为 1。|
|4|	~ (位非)  一元操作符，反转操作数中的所有位。  例如: (~B) 为 -4。|
|5|	<< (左移位))  将第一个操作数中的所有位向左移动，移动的位置数由第二个操作数指定，新的位由0填充。将一个值向左移动一个位置相当于乘以2，移动两个位置相当于乘以4，以此类推。  例如: (A << 1) 为 4。|
|6|	>> (右移位)  左操作数的值向右移动，移动位置数量由右操作数指定。  例如: (A >> 1) 为 1。|

## 5. 赋值运算符

赋值运算符用于将一个值赋给变量或表达式。我们平时使用最多的就是简单赋值 “=”，其它的赋值运算符仅仅起到简写的作用，都可以使用简单赋值代替。

|序号	|运算符与描述|
|:---|:---|
|1|	= (简单赋值)   将右侧操作数的值赋给左侧操作数。   例如: C = A + B 表示 A + B 赋给 C。|
|2|	+= (相加赋值)   将右操作数添加到左操作数并将结果赋给左操作数。   例如: C += A 等价于 C = C + A。|
|3|	−= (相减赋值)   从左操作数减去右操作数并将结果赋给左操作数。   例如: C -= A 等价于 C = C – A。|
|4|	*= (相乘赋值)   将右操作数与左操作数相乘，并将结果赋给左操作数。   例如: C *= A 等价于 C = C * A。|
|5|	/= (相除赋值)   将左操作数与右操作数分开，并将结果分配给左操作数。   例如: C /= A 等价于 C = C / A。|
|6|	%= (取模赋值)   使用两个操作数取模，并将结果赋给左边的操作数。   例如: C %= A 等价于 C = C % A。|

## 6. 条件运算符

条件运算符是一个三元运算符，用于根据条件的真假选择不同的值。

这是一种简洁的表达式形式，可以由条件语句来代替。

|序号	|运算符与描述|
|:---|:---|
|1|	? : (条件运算符 )   例如：C?X :Y，如果条件 C 为真 ，则取前一个值 X，否则取后一个值 Y。|

例如：

```solidity
uint value = status==1?100:200;
```

如果 status 的值为 1，那么 value 的值就是 100。

如果 status 的值不为 1，那么 value 的值就等于 200。
