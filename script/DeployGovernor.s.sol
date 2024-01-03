// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {ParamGovernor} from "../src/ParamGovernor.sol";
import {TimelockController} from "@openzeppelin/contracts/governance/TimelockController.sol";
import {IVotes} from "@openzeppelin/contracts/governance/utils/IVotes.sol";

contract DeployParamGovernor is Script {
    address public constant TOKEN_ADDRESS =
        0x534422737CeC96554B3815f1b919d0429E841975;
    address public constant TIMELOCK_ADDRESS =
        0x89FDA7413C482F0a12a1Fd0ec29EE4B42Eef62BD;

    function run() external {
        vm.startBroadcast();

        // Cast the token address to the IVotes interface as required by the governor constructor
        IVotes token = IVotes(TOKEN_ADDRESS);

        // Cast the timelock address to the TimelockController as required by the governor constructor
        TimelockController timelock = TimelockController(
            payable(TIMELOCK_ADDRESS)
        );

        // Deploy the ParamGovernor contract with the token and timelock
        new ParamGovernor(token, timelock);

        vm.stopBroadcast();
    }
}
