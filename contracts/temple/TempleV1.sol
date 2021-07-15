// SPDX-License-Identifier: MIT

pragma solidity 0.6.12;

import '../libs/SafeBEP20.sol';
import '../libs/BEP20.sol';
//import 'https://github.com/BenTokenFinance/bentoken/blob/main/contracts/libs/SafeBEP20.sol';
//import 'https://github.com/BenTokenFinance/bentoken/blob/main/contracts/libs/BEP20.sol';

contract Temple is Ownable {
    using SafeBEP20 for BEP20;

    BEP20 public gben;

    event Worship(address indexed user, uint256 amount, string prayer);

    constructor(
        BEP20 _gben
    ) public {
        gben = _gben;
    }

    function worship(uint256 amount, string prayer) external {
        require (amount > 0, "Worship: amount needs to be positive");

        gben.safeTransferFrom(address(msg.sender), address(gben), amount);

        emit Worship(msg.sender, amount, prayer);
    }
}