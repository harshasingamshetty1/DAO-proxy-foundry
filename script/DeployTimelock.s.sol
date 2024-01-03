// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {TimeLock} from "../src/TimeLock.sol";

contract DeployTimeLock is Script {
    uint256 public constant MIN_DELAY = 1; // 1 block - after a vote passes, you have 1 block before you can enact

    address[] _proposers;
    address[] _executors;

    function run() external {
        vm.startBroadcast();

        // Deploy the TimeLock contract
        new TimeLock(MIN_DELAY, _proposers, _executors);

        vm.stopBroadcast();
    }
}
