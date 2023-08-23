// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import {FactoryContract} from "../src/FactoryContract.sol";
import {Counter} from "../src/Counter.sol";

contract FactoryContractTest is Test{
  FactoryContract public fc;
  event Test1(bytes code);
  function setUp() public {
    fc = new FactoryContract();
  }

  function testCreateNewContract1() public {
    address addr = fc.createNewContract1();
    assertEq(Counter(addr).owner(),address(this));
  }

  function testCreate2() public {
    bytes32 salt = keccak256("create22");
    address addr = fc.create2(salt);
    console.log(addr);
    console.logBytes32(salt);
    // bytes memory bytecode = type(Counter).creationCode;
    // console.logBytes(bytecode);
    // emit Test1(bytecode);
    // 64バイト
    // bytes memory byteData = "1234";
    // bytes memory a = "a";
    // byteData.length    --> 64
    // byteData[0]    --> 0xf0
    // byteData[63]    --> 0x96
    // console.logBytes(a);
    // emit Test1(a);

  }


}