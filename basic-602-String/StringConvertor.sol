// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StringConvertor {

    function bytesToString() external pure
        returns (string memory)
    {
        bytes memory myBytes = new bytes(2);
        myBytes[0] = 'o';
        myBytes[1] = 'k';
        return string(myBytes); // 返回字符串 ok
    }
}
