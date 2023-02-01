// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract WhiteList {
    // Max number of whielisted addresses
    uint8 public maxWhitelistedAddresses;

    // Hash map to check if address is whitelisted or not
    mapping(address=>bool) public whitelistedAddresses;

    // A variable for keep tracking number of whielisted addresses
    uint8 public numAddressesWhitelisted;

    // Setting the Max number of whitelisted addresses
    // User will put the value at the time of deployment
    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses =  _maxWhitelistedAddresses;
    }

    function whitelist() public {
        // check if the user has already been whitelisted
        require(!whitelistedAddresses[msg.sender], "Sender has already been whitelisted");

        // check if the numAddressesWhitelisted < maxWhitelistedAddresses, if not then throw an error.
        require(numAddressesWhitelisted<maxWhitelistedAddresses, "Limited has reacheed");

        // execute
        whitelistedAddresses[msg.sender] = true;
        numAddressesWhitelisted += 1;
    }
}