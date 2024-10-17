// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {DeployBasicNft} from "script/DeployBasicNft.s.sol";
import {BasicNft} from "src/BasicNft.sol";

contract BasicNftTest is Test {
    DeployBasicNft public deployer;
    BasicNft public basicnft;

    function setUp() public {
        deployer = new DeployBasicNft();
        basicnft = deployer.run();
    }

    function testNameIsCorrect() public view {}
}
