// scripts/Deploy.sol

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {AuroraFaucet} from "../src/AuroraFaucet.sol";

contract DeployAuroraFaucet is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY_LOCAL");
        vm.startBroadcast(deployerPrivateKey);
        new AuroraFaucet();
        vm.stopBroadcast();
    }
}
