// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalVar {
   // 返回当前函数调用所在的区块号、时间戳、调用者地址
   function getGlobalVars() public view returns(uint,uint,address){
     return (block.number, block.timestamp, msg.sender);
   }
}