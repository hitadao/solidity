// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Assert {

  // 除法函数
  function divide(uint256 dividend, uint256 divisor) public pure returns(uint256) {
    assert(divisor != 0); // 确保除数不为零
    return dividend / divisor;
  }
}
