// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract IntegerOps {
  int public a = 2;
  int public b = 3;
  int public a_add_b = a + b; // a_add_b = 5
  int public a_sub_b = a - b; // a_sub_b = -1
  int public a_mul_b = a * b; // a_mul_b = 6
  int public a_div_b = a / b; // a_div_b = 0
  int public a_mod_b = a % b; // a_mod_b = 2
}
