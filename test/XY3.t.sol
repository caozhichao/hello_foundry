// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import {LibDiamond} from "../src/utils/LibDiamond.sol";
import {IDiamondCut} from "../src/interfaces/IDiamondCut.sol";

contract XY3Test is Test {
    // struct DiamondStorage {
    //     // maps function selector to the facet address and
    //     // the position of the selector in the facetFunctionSelectors.selectors array
    //     /*
    //     * slot 
    //     * LibDiamond.DIAMOND_STORAGE_POSITION + 0
    //     * slot = hash(key,slot)
    //     * _ethers.utils.keccak256(_ethers.utils.defaultAbiCoder.encode(['bytes4','uint256'],['0x1f931c1c','0xc8fcad8db84d3cc18b4c41d551ea0ee66dd599cde068d998e57d5e09332c131c']))
    //     */
    //     mapping(bytes4 => FacetAddressAndPosition) selectorToFacetAndPosition; 
    //     // maps facet addresses to function selectors
    //     mapping(address => FacetFunctionSelectors) facetFunctionSelectors; // slot LibDiamond.DIAMOND_STORAGE_POSITION + 1
    //     // facet addresses
    //     address[] facetAddresses;
    //     // Used to query if a contract implements an interface.
    //     // Used to implement ERC-165.
    //     mapping(bytes4 => bool) supportedInterfaces;
    //     // owner of the contract
    //     address contractOwner; // slot LibDiamond.DIAMOND_STORAGE_POSITION + 4
    // }

    function testStorage() public {
        // LibDiamond.DiamondStorage storage  ds = LibDiamond.diamondStorage();
        // console.log(ds.contractOwner);
        // console.log(ds.facetAddresses.length);
        // console.logBytes32(LibDiamond.DIAMOND_STORAGE_POSITION);
        console.logBytes4(IDiamondCut.diamondCut.selector);
    }
}
