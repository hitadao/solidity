// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BytesConvertor {

    function stringToBytes() external pure
        returns (bytes memory)
    {
        string memory myString = "Hello World";
        return bytes(myString); // 返回字节数组
    }
}
