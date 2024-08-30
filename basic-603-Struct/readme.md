# Solidity基础教程:&nbsp;&nbsp;&nbsp;&nbsp;603.结构体 struct

本章学习 **`Solidity`** 结构体类型的定义和使用方法。

**视频**：[Bilibili](https://space.bilibili.com/2112923943)  |  [Youtube](https://www.youtube.com/@BinSchoolApp)

**官网**：[BinSchoolOrg](https://binschool.org)

**代码**：[github.com/hitadao](https://github.com/hitadao)

**推特**：[@Hita_DAO](https://x.com/hita_dao)    **Discord**：[Hita_DAO](https://discord.gg/dzWY3QYGrx)

-----
**`Solidity`** 中的结构体是一种用户自定义的数据类型，它通过组合多个不同类型的变量成员来创建一个新的复合类型。

例如，一本书包含以下信息：

```solidity
Title：标题
Author：作者
Book ID：书号
```

那么，我们就可以定义一个结构体类型，用来表示一本书。

## 1.  定义

定义一个结构体类型使用 **`struct`** 关键字，它的语法如下：

```solidity
struct struct_name { 
   type1 type_name_1;
   type2 type_name_2;
   type3 type_name_3;
   ...
}
```

其中 **`struct_name`** 是结构体的名称，**`typeN`** 是结构体成员的数据类型，**`type_name_N`** 是结构体成员的名字。

比如，我们定义一个结构体类型 **`Book`**，用来表示一本书：

```solidity
struct Book { 
   string title;
   string author;
   uint ID;
}
```

## 2. 使用方法
我们要访问结构体的成员，需要使用成员访问操作符(.)。

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StructAccess {
   struct Book { 
     string title;
     string author;
     uint ID;
   }  // 定义结构体 Book

   Book book;  // 使用结构体 Book 声明变量

   function setBook() public {
      book.title = "Learn Solidity"; // 设置结构体的成员 title
      book.author = "BinSchool";
      book.ID = 1;
   }

  function getBookAuthor() public view returns(string memory) {
      return book.author; // 读取结构体的成员 author
  }
}
```

我们把合约代码复制到 **`Remix`**，进行编译，并部署到区块链上。

我们先点击 **`setBook`** 来设置书的信息，然后点击 **`getBookAuthor`**，来获取这本书的作者，返回的调用结果为：

```solidity
string: BinSchool
```

## 3. 初始化方式

结构体变量共有 3 种初始化数据的方式：按字段顺序初始化、按字段名称初始化、按默认值初始化。

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StructInit {
  struct Book { 
    string title;
    string author;
    uint ID;
  }  // 定义结构体 Book
 

  function getBooks() public pure returns(Book memory,Book memory,Book memory) {
    // 按字段顺序初始化
    Book memory book1 = Book('Learn Java', 'BinSchool', 1);

    // 按字段名称初始化
    Book memory book2 = Book({title:"Learn JS", author:"BinSchool", ID:2});

    // 按默认值初始化
    Book memory book3;
    book3.ID = 3;
    book3.title = 'Learn Solidity';
    book3.author = 'BinSchool';
    return (book1, book2, book3);
  }
}
```

我们把合约代码复制到 **`Remix`**，进行编译，并部署到区块链上。

点击 **`getBooks`** 后，返回的调用结果为：

```solidity
0: tuple(string,string,uint256): Learn Java,BinSchool,1
1: tuple(string,string,uint256): Learn JS,BinSchool,2
2: tuple(string,string,uint256): Learn Solidity,BinSchool,3
```