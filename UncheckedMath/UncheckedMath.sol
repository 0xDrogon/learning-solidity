// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.7;


contract UncheckedMath {
    
    function add(uint a, uint b) external pure returns (uint) {
        unchecked {                 // 22103 gas
            return a + b;   
        }
        //return a + b;             // 22291 gas
    }

    function sub(uint a, uint b) external pure returns (uint) {
        unchecked {                 // 22147 gas
            return a - b;   
        }
        //return a - b;             // 22329 gas
    }

    function sumOfCubes(uint a, uint b) external pure returns (uint) {
        unchecked {                 // 22183 gas
            uint a3 = a * a * a;
            uint b3 = b * b * b;
            return a3 + b3;
        }
        // uint a3 = a * a * a;     
        // uint b3 = b * b * b;
        // return a3 + b3;          // 23179 gas
    }
}