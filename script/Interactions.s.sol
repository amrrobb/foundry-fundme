// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script, console} from "forge-std/Script.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";
import {FundMe} from "../src/FundMe.sol";

contract FundFundMe is Script {
    uint256 constant SEND_VALUE = 0.01 ether;

    function fundFundMe(address mostRecentAddress) public {
        vm.startBroadcast();
        FundMe(payable(mostRecentAddress)).fund{value: SEND_VALUE}();
        vm.stopBroadcast();

        console.log("Funded FundMe with %s", SEND_VALUE);
    }

    function run() external {
        address mostRecentAddress = DevOpsTools.get_most_recent_deployment(
            "FundMe",
            block.chainid
        );
        // vm.startBroadcast();
        fundFundMe(mostRecentAddress);
        // vm.stopBroadcast();
    }
}

contract WithdrawFundMe is Script {
    function withdrawFundMe(address mostRecentAddress) public {
        vm.startBroadcast();
        FundMe(payable(mostRecentAddress)).withdraw();
        vm.stopBroadcast();
    }

    function run() external {
        address mostRecentAddress = DevOpsTools.get_most_recent_deployment(
            "FundMe",
            block.chainid
        );
        // vm.startBroadcast();
        withdrawFundMe(mostRecentAddress);
        // vm.stopBroadcast();
    }
}
