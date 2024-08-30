// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Debug {
    event TransferLog(address); // 定义事件

    function transfer() public {
        // 调用事件
        emit TransferLog(msg.sender);
    }
}
