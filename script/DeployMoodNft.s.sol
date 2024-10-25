// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {MoodNft} from "src/MoodNft.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

contract DeployMoodNft is Script {
    function run() external returns (MoodNft) {
        string memory sadSvg = vm.readFile("./img/sad.svg");
        string memory happySvg = vm.readFile("./img/happy.svg");

        vm.startBroadcast();
        MoodNft moodNft = new MoodNft(
            svgToImageURI(sadSvg),
            svgToImageURI(happySvg)
        );
        vm.stopBroadcast();
        return moodNft;
    }

    function svgToImageURI(
        // what this function is doing is img to image URI(instead of manually creating it o our terminal(base64 -i ..))
        string memory svg
    ) public pure returns (string memory) {
        string memory baseURL = "data:image/svg+xml;base64,";
        string memory svgBase64Encoded = Base64.encode(
            bytes(string(string.concat(svg)))
            //The above function is taking the svg string parameter, converting it to bytes then encoding it with the OpenZeppeling Base64.encode function, and then prepends the encoded value with our baseURL
        );
        return string(string.concat(baseURL, svgBase64Encoded));
    }
}
