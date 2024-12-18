// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract chrisMasWishList {
   string public owner; // Sto the name of wish list owner
   uint public totalItems; // Track the total number of items in the wish list (though it's not updated in the code)
   bool public ispublic; // Determines whether the wish list is public or private

   string[] public wishlist;
   mapping(address => string[]) public userWishlist;
   
    // Function to add an item to the calling user's wish list
    // `item` is the name of the item being added
    function addItem(string memory item) public {
        userWishlist[msg.sender].push(item);
    }

    // Function to retrieve the calling user's wish list
    // Returns an array of items in the user's wish list
    function getWishList() public view returns (string[] memory) {
        return  userWishlist[msg.sender];
    }

    // Function to toggle the visibility of the wish list (public or private)
    // `status` indicates whether the wish list should be public (true) or private (false)
    function toggleVisibility(bool status) public {
        ispublic = status;
    }

    // Share an item from the caller's wish list with another user
    function shareItem(address recipient, string memory item) public {
    bool itemExists = false; // Check if the item exists in the sender's wish list
    
    for (uint i = 0; i < userWishlist[msg.sender].length; i++) {
        if (keccak256(abi.encodePacked(userWishlist[msg.sender][i])) == keccak256(abi.encodePacked(item))) {
            itemExists = true;
            break;
        }
    }

    require(itemExists, "Item does not exist in your wish list.");

    // Add the item to the recipient's wish list
      userWishlist[recipient].push(item);
    }

    // Function to delete all items from a specific user's wish list
    // Only clears the array, does not delete individual items
    function deleteItem(address list) public  {
        require(list == msg.sender, "You can only delete your own wish list.");
        delete userWishlist[list];
    }

}
