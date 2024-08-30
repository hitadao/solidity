// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0; 

contract EnumOps {
    // 定义枚举型
    enum gender {male, female}

    // 使用枚举型声明状态变量
    gender private myGender = gender.female;

    // 函数内使用枚举类型
    function useEnum() public returns(gender) {
        gender t = myGender;
        myGender =  gender.male;
        return t; 
    }
   // 枚举型用作返回值
    function returnEnum() public pure returns(gender) {
        return gender.female; 
    }
    // 枚举值转换为整型
    function convertInt() public pure returns(uint) {
        return uint(gender.female); 
    }
    // 整型转换为枚举型
    function convertEnum() public pure returns(gender) {
        return gender(1); 
    }
}