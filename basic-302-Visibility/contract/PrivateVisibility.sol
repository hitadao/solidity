// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PrivateVisibility {
  uint256 private delta = 8; // 可见性声明为 private

  function addDelta(uint256 num) external view returns(uint256) {
    uint256 sum = num + delta; // 函数内可以使用状态变量 delta
    return sum;
  }
}
