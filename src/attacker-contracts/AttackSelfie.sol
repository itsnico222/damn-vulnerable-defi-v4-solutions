// SPDX-License-Identifier: MIT

pragma solidity =0.8.25;

import {Test, console} from "forge-std/Test.sol";
import {SimpleGovernance} from "../../src/selfie/SimpleGovernance.sol";
import {SelfiePool} from "../../src/selfie/SelfiePool.sol";
import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";