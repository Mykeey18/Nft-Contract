// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";
import {BasicNft} from "src/BasicNft.sol";
import {MoodNft} from "src/MoodNft.sol";

contract MintBasicNft is Script {
    string public constant PUG = "ipfs://QmVKvfbUyHrzPUBVQQinQ922sQZ7vszoddM9EA3jPC93xg/?filename=metadata.json";

    function run() external {
        address mostRecentlyDeployedBasicNft = DevOpsTools.get_most_recent_deployment("BasicNft", block.chainid);

        mintNftOnContract(mostRecentlyDeployedBasicNft);
    }

    function mintNftOnContract(address basisNftAddress) public {
        vm.startBroadcast();
        BasicNft(basisNftAddress).mintNft(PUG);
        vm.stopBroadcast();
    }
}

contract MintMoodNft is Script {
    function run() external {
        address mostRecentlyDeployedMoodNft = DevOpsTools.get_most_recent_deployment("MoodNft", block.chainid);
        mintNftMood(mostRecentlyDeployedMoodNft);
    }

    function mintNftMood(address MoodNftAddress) public {
        vm.startBroadcast();
        MoodNft(MoodNftAddress).mintNft();
        vm.stopBroadcast();
    }
}

contract FlipMoodNft is Script {
    uint256 public constant TOKEN_ID_TO_FLIP = 0;

    function run() external {
        address mostRecentlyDeployedMoodNft = DevOpsTools.get_most_recent_deployment("MoodNft", block.chainid);
        flipMoodContract(mostRecentlyDeployedMoodNft);
    }

    function flipMoodContract(address MoodNftMood) public {
        vm.startBroadcast();
        MoodNft(MoodNftMood).flipMood(TOKEN_ID_TO_FLIP);
        vm.stopBroadcast();
    }
}
