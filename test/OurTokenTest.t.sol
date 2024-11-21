//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {DeployToken} from "../script/DeployToken.s.sol";
import {OurToken} from "../src/OurToken.sol";

contract OurToken is Test{
    OurToken public ourToken;
    DeployToken public deployer;

    address bobb = makeAddr("bodd");
    address alice= makeAddr("alice");

    uint256 public constant Starting_balance = 100 ether;
    function setUp() public {
        deployer = new DeployToken();
        ourToken = deployer.run();

        vm.prank(msg.sender);
        ourToken.transfer(bobb, Starting_balance);
    }

    function testBobbBalance() public {
        assertEq(Starting_balance, ourToken.balanceOf(bobb));
    }
}