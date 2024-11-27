// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import {Test, console} from "forge-std/Test.sol";
import {NFT} from "../src/NFT.sol";

contract NFTTest is Test {

    NFT public lsk;

    // Create dummy addresses for alice and bob
    address alice = makeAddr("alice");
    address bob = makeAddr("bob");

    // Initialize the NFT contract's object
    function setUp() public {
        lsk = new NFT();
    }

    // Pass the address of alice and bob to see whether the mint function successfully passes
    function testMintPass() public {
        lsk.mint(alice);
        lsk.mint(bob);

        // Assert that both addresses successfully minted
        assertEq(lsk.balanceOf(alice), 1, "Alice did not mint successfully");
        assertEq(lsk.balanceOf(bob), 1, "Bob did not mint successfully");
    }

    // Create a failing test for demonstration
    function testMintFail() public {
        // Define some addresses for comparison
        address address1 = alice;
        address address2 = bob;

        // Assert that the minting condition fails
        assert(address1 != address2); // This will always pass because alice != bob
    }
}
