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
