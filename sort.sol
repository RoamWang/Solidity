//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract Sort {
    function insertSort(uint[] memory array) public pure returns(uint[] memory) {
        for (uint i = 1; i < array.length; i++) {
            uint temp = array[i];
            uint j = i;
            while (j > 0 && array[j-1] > temp) {
                array[j] = array[j-1];
                j--;
            }
            array[j] = temp;
        }
        
        return array;
    }

    function bubbleSort(uint[] memory array) public pure returns(uint[] memory) {
        if (array.length == 0) {
            return array;
        }

        uint i = array.length - 1;
        while (i > 0) {
            uint last_change_index = 0;
            for (uint j = 0; j < i; j++) {
                if (array[j] > array[j+1]) {
                    uint temp = array[j];
                    array[j] = array[j+1];
                    array[j+1] = temp;

                    last_change_index = j;
                }
            }

            i = last_change_index;
        }

        return array;
    }

    //sth wrong here, I will fix it when I could
    function quickSort(uint[] memory array, uint left, uint right) public pure returns(uint[] memory) {
        if (left < right) {
            uint guard = array[left];
            uint i = left;
            uint j = right;
            while (i < j) {
                while (i < j && array[j] >= guard) {//从后向前,找第一个<guard的元素
                    j--;
                }
                if (i < j) {
                    array[i++] = array[j];
                }

                while (i < j && array[i] < guard) {//从前向后,找第一个>guard的元素
                    i++;
                }
                if (i < j) {
                    array[j--] = array[i];
                }
            }

            array[i] = guard;
            quickSort(array, left, i-1);
            quickSort(array, i+1, right);

            return array;
        }
    }
}