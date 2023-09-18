pragma solidity ^0.8.13;

import "forge-std/Test.sol";

contract CommonTest is Test {

  Helper public h;
  function setUp() public {
    // console.log("aa123456");
    h = new Helper();
  }

  function test1() public {
    console2.log(msg.sender);
    vm.prank(msg.sender);
    console2.log(h.whoCalled());
    console2.log(address(this));
  }

  function testFork() public{
    // fork mainnet
    string memory rpc = vm.envString("MAINNET_RPC_URL");
    // string memory rpc = vm.envString("GOERLI_RPC_URL");
    uint256 mainnet = vm.createFork(rpc);
    vm.selectFork(mainnet);
    console2.log(block.number);

    // fork goerli
    rpc = vm.envString("GOERLI_RPC_URL");
    // uint256 goerli = vm.createFork(rpc);
    // vm.selectFork(goerli);
    // console2.log(block.number);
    console2.log(rpc);
  }

}

contract Helper {
  function whoCalled() public view returns(address){
    return msg.sender;
  }
}