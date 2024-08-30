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
