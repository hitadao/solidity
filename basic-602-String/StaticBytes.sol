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
