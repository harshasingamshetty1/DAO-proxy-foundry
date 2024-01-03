// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {ParamToken} from "../src/ParamToken.sol";

contract DeployParamToken is Script {
    uint256 public constant INITIAL_SUPPLY = 10000 ether;
    address public constant RECIPIENT_ONE =
        0xb98Ee84a0dcECf67399d0bca3C28A105EA0268e5;
    address public constant RECIPIENT_TWO =
        0xFB1a8B02b62aa93326dD2fF8916A703E653990Db;

    function run() external {
        vm.startBroadcast();

        // Deploy the ParamToken contract
        ParamToken paramToken = new ParamToken();

        // Mint INITIAL_SUPPLY tokens to the deployer's address
        paramToken.mint(msg.sender, INITIAL_SUPPLY);

        // Mint INITIAL_SUPPLY tokens to the first recipient
        paramToken.mint(RECIPIENT_ONE, INITIAL_SUPPLY);

        // Mint INITIAL_SUPPLY tokens to the second recipient
        paramToken.mint(RECIPIENT_TWO, INITIAL_SUPPLY);

        vm.stopBroadcast();
    }
}
