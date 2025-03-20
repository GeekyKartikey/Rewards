// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ReferralRewards {
    mapping(address => address) public referrer;  // Stores referrer for each user
    mapping(address => uint256) public rewards;   // Stores token rewards for each user
    address public admin;

    // Hardcoded referrals (replace with actual addresses)
    address constant USER1 = 0x1111111111111111111111111111111111111111;
    address constant USER2 = 0x2222222222222222222222222222222222222222;
    address constant REFERRER1 = 0x9999999999999999999999999999999999999999;
    address constant REFERRER2 = 0x8888888888888888888888888888888888888888;

    // Hardcoded relationships
    constructor() {
        admin = msg.sender;
        referrer[USER1] = REFERRER1;
        referrer[USER2] = REFERRER2;
    }

    // Admin manually distributes rewards to referrers
    function distributeRewards(address user, uint256 amount) public {
        require(msg.sender == admin, "Only admin can distribute rewards");

        address refer = referrer[user];
        if (refer != address(0)) {
            rewards[refer] += amount;
        }
    }

    // Get reward balance
    function getRewardBalance(address user) public view returns (uint256) {
        return rewards[user];
    }
}
