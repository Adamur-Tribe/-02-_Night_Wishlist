// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract ChristMasWishlist{
    //code goes here

    string public owner;
    uint public totalItem;
    bool public isPublic;


    string public wishlist;
    mapping(address => string[]) public userWishlists;

    function addItem(string memory item) public {
        userWishlists[msg.sender].push(item);
    }
    function getWishlist() public view returns (string[] memory){
        return userWishlists[msg.sender];
    }

    function toggleVisibility(bool status) public {
        isPublic = status;
    }
    function removeItem() public{
        userWishlists[msg.sender].pop();

    }

}


