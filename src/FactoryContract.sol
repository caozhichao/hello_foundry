pragma solidity ^0.8.13;

import "./Counter.sol";
import "@openzeppelin/contracts/utils/Create2.sol";
contract FactoryContract {

  function createNewContract1() public returns(address){
    Counter c = new Counter(msg.sender);
    return address(c);
  }

  function create2(bytes32 salt) public returns(address){
     Counter c = new Counter{salt: salt}(msg.sender);
     return address(c);
  }

  // function create2() public pure returns(bytes memory){
  //   return type(Counter).creationCode;
  // }

  // function calculateAddr() public view {

  // }


}