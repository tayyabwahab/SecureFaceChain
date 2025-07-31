// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract SecureArray {
    struct MatchResult {
        int256 bestMatchIndex;
        bytes32 bestMatchId;
    }

    int256[][] private secureArrays;

    function addElements(int256[] memory elements) public {
        require(elements.length == 4, "Invalid array length");
        secureArrays.push(elements);
    }

    function getArraysCount() public view returns (uint256) {
        return secureArrays.length;
    }

    function compareElements(int256[] memory input) public view returns (MatchResult memory) {
        require(input.length == 4, "Invalid input array length");
        
        int256 bestMatchIndex = -1;
        bytes32 bestMatchId;
        int256 bestMatchScore = -1;

        for (uint256 i = 0; i < secureArrays.length; i++) {
            int256 score = 0;
            for (uint256 j = 0; j < 4; j++) {
                int256 diff = secureArrays[i][j] - input[j];
                if (diff >= 0) {
                    if (diff <= secureArrays[i][j] / 200) {
                        score++;
                    }
                } else {
                    if (-diff <= input[j] / 200) {
                        score++;
                    }
                }
            }

            if (score > bestMatchScore) {
                bestMatchScore = score;
                bestMatchIndex = int256(i);
            }
        }

        if (bestMatchIndex >= 0) {
            bestMatchId = keccak256(abi.encodePacked(bestMatchIndex));
        }

        return MatchResult(bestMatchIndex, bestMatchId);
    }

    function getArrayByIndex(uint256 index) public view returns (int256[] memory) {
        require(index < secureArrays.length, "Index out of bounds");
        return secureArrays[index];
    }

    function getLatestArray() public view returns (int256[] memory) {
        require(secureArrays.length > 0, "No arrays stored");
        return secureArrays[secureArrays.length - 1];
    }
}