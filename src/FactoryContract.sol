pragma solidity ^0.8.13;

import "@openzeppelin/contracts/utils/Create2.sol";
import "./Counter.sol";

contract FactoryContract {

  bytes32 public constant SALT = keccak256("test");
  
  function createNewContract1() public returns(address){
    Counter c = new Counter(msg.sender);
    return address(c);
  }

  function create2(bytes32 salt) public returns(address){
     Counter c = new Counter{salt: salt}(msg.sender);
     return address(c);
  }

  function create2Assembly() public returns(address){
    // 合约字节码+构造函数参数
    bytes memory creationCode = bytes.concat(type(Counter).creationCode,abi.encode(msg.sender));
    return Create2.deploy(0, SALT, creationCode);
  }

  function calculateAddr() public view returns(address){
    bytes memory creationCode = bytes.concat(type(Counter).creationCode,abi.encode(msg.sender));
    bytes32 bytecodeHash = keccak256(creationCode);
    address addr = Create2.computeAddress(SALT, bytecodeHash);
    return addr;
  }


}