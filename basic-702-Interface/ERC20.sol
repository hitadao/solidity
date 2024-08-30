// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IERC20 {
  function name() external view returns (string memory);
  function symbol() external view returns (string memory);
  function decimals() external view returns (uint8);
}

contract ERC20 is IERC20 {
  string _name = "MyCoin"; // 代币名称
  string _symbol = "MYC"; // 代币符号
  uint8 _decimals = 18; // 小数精度

  function name() external view returns (string memory) {
    return _name;
  }

  function symbol() external view returns (string memory) {
    return _symbol;
  }

  function decimals() external view returns (uint8) {
    return _decimals;
  }
}
