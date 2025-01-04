//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract ChristMasWishlist{
    //code goes here

     //VARIABLES AND DATA TYPES

    // TYPES OF VARIABLES -variables are used to store data 
    //state variables -stored permanently on the blockchain, accessed/modified by internal or external function calls from within the contract
    //local variables - temporary variables, defined inside of a funtion
    //global variables -predefined variables that can be accessed from any part of the contract, decleared outside of a contract

     //Data Types
     //bool: boolean data type used to store true or false values
     //uint: unit data type used to store unsigned integers/non-negative numbers e.g uni16
     //int: -used to store signed data type e.g -12
     //string: -used to store string data types in a variable
     //Address: used to store wallet and smart contract addresses

     string public owner;
     uint public totalItems;
     bool public isPublic;

     //An array to hold wishlist items
     //A mapping to link users with their lists
     string[] public wishlist;
     mapping(address =>string[]) public userWishlists;

     function addItems(string memory item) public{
        userWishlists[msg.sender].push(item);
     }

function getWishlists() public view returns (string[] memory) {
    return userWishlists[msg.sender];

}

function toggleVisibility(bool status) public {
    isPublic = status;
}

//A function to remove an item from the wishlists
function removeItem() public {
    userWishlists[msg.sender].pop();
}

// Mapping to store wishlist visibility status
mapping(address => bool) public publicWishlists;

// Event to notify when a wishlist's visibility changes
event WishlistVisibilityChanged(address indexed user, bool isPublic);

//function to share the Wishlist publicly
function shareWishlist(bool isPublic) public {
    publicWishlists[msg.sender] = isPublic;
}

}