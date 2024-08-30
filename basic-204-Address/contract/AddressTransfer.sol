// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0; 

contract AddressTransfer { 
    address account = 0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db;

    function transferETH() public {
        payable(account).transfer(1 ether);
}
