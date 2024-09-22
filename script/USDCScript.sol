// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {USDClone} from "../src/USDCClone.sol";
import {ERC20} from "@openzeppelin-contracts-5.0.2/token/ERC20/ERC20.sol";

contract UsdcCloneScript is Script {
    USDClone public usdcClone;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        usdcClone = new USDClone(address(0x96A033fb883feb5ADD1679F7D126B64248714290));

        vm.stopBroadcast();
    }
}

contract USDCBalanceScript is Script {
    function run() public {
        vm.startBroadcast();

        address erc20ContractAddress = vm.envAddress("USDC_ADDRESS");

        address accountAddress = 0x96A033fb883feb5ADD1679F7D126B64248714290;

        ERC20 erc20 = ERC20(erc20ContractAddress);

        uint256 balance = erc20.balanceOf(accountAddress);
        uint8 decimals = erc20.decimals();

        console.log("ERC20 Balance:", balance / (10 ** decimals));

        vm.stopBroadcast();
    }
}
