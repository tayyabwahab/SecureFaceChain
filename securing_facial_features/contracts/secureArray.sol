// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract SecureArray {
    int256[54] private secureArray;

    function setElements(int256[] memory elements) public {
        require(elements.length == 54, "Invalid array length");
        
        for (uint256 i = 0; i < elements.length; i++) {
            secureArray[i] = elements[i];
        }
    }

    function getElements() public view returns (int256[] memory) {
        int256[] memory elements = new int256[](54);
        
        for (uint256 i = 0; i < secureArray.length; i++) {
            elements[i] = secureArray[i];
        }
        
        return elements;
    }
}