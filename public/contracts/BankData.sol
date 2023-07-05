// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract BankData {

    mapping (address => address) public clientToBank;
    mapping (address => address[]) public bankToClient;

    constructor()

}