// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0; 

contract AddressCompare {
    address address1 = 0xB2D02Ac73b98DA8baF7B8FD5ACA31430Ec7D4429;
    address address2 = 0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db;
    
    function compareAddresses() public view returns (bool) {
        return (address1 == address2);
    }
}
