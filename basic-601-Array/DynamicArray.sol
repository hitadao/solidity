// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DynamicArray {
    // 初始化动态长度数组为[1,2,3]
    uint[] balance = [uint(1), 2, 3];

    function dynamicArray() external returns (uint length, uint[] memory array) {
        // 追加两个新元素4、5
        balance.push(4);
        balance.push(5);

        // 删除最后一个元素 5
        balance.pop();

        // 返回数组的长度和数组所有元素
        return (balance.length, balance);
    }
}
