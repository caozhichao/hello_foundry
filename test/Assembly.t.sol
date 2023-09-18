// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import {Assembly} from "../src/Assembly.sol";

contract AssemblyTest is Test {

    Assembly public a;

    function setUp() public {
      a = new Assembly();
    }
    function testAssembly() public view {
      console.logBytes32(a.test());
    }
    function testAssemblyTest2() public view {
      console.logBytes32(a.test2());
      // console.logBytes4(a.test2());
      // a.test2();
      // console.logBytes(a.test2());
      // bytes1 b = 0x01;
      // console.logBytes1(b);
    }
}
