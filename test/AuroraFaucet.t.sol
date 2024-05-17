// test/AuroraFaucet.t.sol

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/AuroraFaucet.sol";

contract AuroraFaucetTest is Test {
    AuroraFaucet public faucet;
    address public owner;
    address public user1;

    function setUp() public {
        // Set up owner and user1
        owner = address(this);
        user1 = address(0x1);

        // Deploy the faucet contract
        faucet = new AuroraFaucet();

        // Fund the faucet contract with 10 ether
        vm.deal(address(faucet), 10 ether);

        // Give user1 some initial balance (1 ether)
        vm.deal(user1, 1 ether);

        // Warp time to simulate passing the request interval
        vm.warp(block.timestamp + 1 days);
    }

    function testInitialOwner() public view{
        assertEq(faucet.owner(), owner);
    }

    function testRequestFunds() public {
        // Simulate user1 requesting funds
        vm.prank(user1);
        faucet.requestFunds();

        // Check user1 balance
        assertEq(user1.balance, 1.1 ether);  // User1 starts with 1 ether, requests 0.1 ether
    }
}
