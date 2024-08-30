// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IERC20 {
  function name() external view returns (string memory);
  function symbol() external view returns (string memory);
  function decimals() external view returns (uint8);
}

contract UseERC20 {
  function getToken() external view returns (string memory,string memory,uint8) {
    // 通过传入合约地址，构造调用接口
    IERC20 token = IERC20(0xd9145CCE52D386f254917e481eB44e9943F39138); 
    return (token.name(),token.symbol(),token.decimals());
  }
}
