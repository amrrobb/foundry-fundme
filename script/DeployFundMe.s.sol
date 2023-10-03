// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

import {Script, console} from "forge-std/Script.sol";
import {FundMe} from "../src/FundMe.sol";
import {HelperConfig} from "./HelperConfig.s.sol";

contract DeployFundMe is Script {
    // function setUp() public {}

    function run() public returns (FundMe deployed) {
        // fake tx
        HelperConfig config = new HelperConfig();
        address priceFeed = config.activeNetworkConfig();

        vm.startBroadcast();
        // real tx
        deployed = new FundMe(priceFeed);
        vm.stopBroadcast();
    }
}
