// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ConstType {
    uint8  public immutable DECIMALS = 18; // 声明时赋值
    uint256 public immutable TOTAL_SUPPLY;

     constructor() {
        TOTAL_SUPPLY = 1000; // 合约部署时赋值
    }
}