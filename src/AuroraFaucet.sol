// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title AuroraFaucet
 * @notice This is a faucet contract for distributing native tokens.
 */
contract AuroraFaucet {
    // Contract owner address
    address public owner;
    // Dispense amount per request (0.1 ETH)
    uint256 public dispenseAmount = 0.1 ether;
    // Minimum interval between requests (24 hours)
    uint256 public requestInterval = 86400;
    // Mapping to store the last request time for each address
    mapping(address => uint256) public lastRequestTime;

    // Event to log fund dispenses
    event FundsDispensed(address indexed receiver, uint256 amount);

    /**
     * @dev Constructor to initialize contract owner.
     */
    constructor() {
        owner = msg.sender;
    }

    /**
     * @dev Method for users to request funds, checking interval and transferring funds.
     */
    function requestFunds() external {
        require(
            block.timestamp >= lastRequestTime[msg.sender] + requestInterval,
            "Request too soon. Please try again later."
        );
        require(
            address(this).balance >= dispenseAmount,
            "Insufficient balance in faucet"
        );

        lastRequestTime[msg.sender] = block.timestamp;

        (bool success, ) = payable(msg.sender).call{value: dispenseAmount}("");
        require(success, "Transfer failed.");

        emit FundsDispensed(msg.sender, dispenseAmount);
    }

    /**
     * @dev Method for the contract owner to change the dispense amount.
     * @param newAmount New dispense amount.
     */
    function changeDispenseAmount(uint256 newAmount) external {
        require(
            msg.sender == owner,
            "Only the owner can change the dispense amount"
        );
        dispenseAmount = newAmount;
    }

    /**
     * @dev Method for the contract owner to change the request interval.
     * @param newInterval New request interval in seconds.
     */
    function changeRequestInterval(uint256 newInterval) external {
        require(
            msg.sender == owner,
            "Only the owner can change the request interval"
        );
        requestInterval = newInterval;
    }

    // Fallback function to accept Ether into the contract
    receive() external payable {}

    // Fallback function to accept Ether into the contract
    fallback() external payable {}
}
