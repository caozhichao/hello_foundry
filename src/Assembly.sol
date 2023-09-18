// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Assembly {


  function test() public pure returns(bytes32){
    assembly {
      let ptr := mload(0x40) // 从0x40位置获取空闲指针的位置
      // mstore(0x0, ptr) 
      // mstore(0x0, add(ptr,0x20))
      mstore(ptr,0xbc4ca0eda7647a8ab7c2061c2e118a18a936f13d) // 写入32个字节 填充0，补齐32个字节  0x000000000000000000000000bc4ca0eda7647a8ab7c2061c2e118a18a936f13d
      // mstore8(add(ptr,0x0b),0xff) // mstore8  写入8个比特位 一个字节
      return (ptr,32)
    }
  }
  function test2() public pure returns(bytes32){
    bytes memory b = "abcd";
    assembly {
      let size := mload(b) // 获取 b字节长度 4(abcd)
      // mstore(ptr,0x02) 
      // mstore(0x0,ptr) 
      return (add(b,0x20),32) // 0x6162636400000000000000000000000000000000000000000000000000000000
      // return (b,32)

      // let res := mload(0x40)       // get free memory pointer
      // mstore(res, 0x20)            // return data offset : abi encoding
      // // mstore(add(res, 0x20), 0x40) // length: 64 bytes
      // // mstore(add(res, 0x40), 1)    // first 32 bytes
      // // mstore(add(res, 0x60), 2)    // second 32 bytes
      // // mstore(0x40, add(res, 0x80)) // update free memory pointer
      // return (res, 0x80)   


    }
  }

  function _isContract(address _contractAddr) internal view returns (bool) {
        uint256 size;
        // solhint-disable-next-line no-inline-assembly
        assembly {
            size := extcodesize(_contractAddr)
        }
        return size > 0;
  }


}