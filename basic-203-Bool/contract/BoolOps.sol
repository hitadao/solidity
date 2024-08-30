// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BoolOps {
  bool public a = true;
  bool public b = false;
  bool public not_a = !a;  // not_a = false
  bool public a_and_b = (a && b); // a_and_b = false
  bool public a_or_b = (a || b); // a_or_b = true
}
