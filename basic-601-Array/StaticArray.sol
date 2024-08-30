// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StaticArray {
    // 初始化固定长度数组为[1,2,3]
    uint[3] balance = [uint(1), 2, 3];

    function staticArray() external returns (uint length, uint[3] memory array) {
        // 获取第 3 个元素的值
        uint element = balance[2];

        // 设置第 3 个元素的值乘以 2
        balance[2] = element * 2;

        // 返回数组的长度和数组所有元素
        return (balance.length, balance);
    }
}
