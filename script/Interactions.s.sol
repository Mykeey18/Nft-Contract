// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";
import {BasicNft} from "src/BasicNft.sol";


contract MintBasicNft is Script {
    string public constant PUG = "ipfs://QmVKvfbUyHrzPUBVQQinQ922sQZ7vszoddM9EA3jPC93xg/?filename=metadata.json";

function run() external {
        address contactAddress = 0x288B1b4B0C9733675f959254426C1dE96208a235;

        mintNftOnContract(contactAddress);
    }


   function mintNftOnContract(address contractAddress) public {
    vm.startBroadcast();
    BasicNft(contractAddress).mintNft(PUG);
    vm.stopBroadcast();
   }
}