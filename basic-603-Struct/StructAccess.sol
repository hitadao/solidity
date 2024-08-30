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
