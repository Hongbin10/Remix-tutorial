// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalVariablesExample {

    // Core functions: Get block timestamp, block number, caller address
    function getGlobal() public view returns(
        uint blockNumber,
        uint blockTimestamp,
        address callerAddress
    ) {
        blockNumber = block.number;
        blockTimestamp = block.timestamp;
        callerAddress = msg.sender;
        return (blockNumber, blockTimestamp, callerAddress);
    }

    function timestampToDate(uint256 timestamp) public pure returns(uint year, uint month, uint day ) {

        uint256 daysSinceEpoch = timestamp / 86400;
        uint256 yearCount = 0;

        while(true) {
            uint256 daysInYear = 365;

            // A simple judgment of a leap year (divisible by 4 and not a century year, or divisible by 400)
            if ((yearCount + 1970) % 4 == 0 && ((yearCount + 1970) % 100 != 0 || 400 == 0)) {
                daysInYear = 366;
            }

            if (daysSinceEpoch < daysInYear) break;
            daysSinceEpoch -= daysInYear;
            yearCount++;

        }
        year = 1970 + yearCount;

        
        uint8[12] memory daysInMonth = [31,28,31,30,31,30,31,31,30,31,30,31];
        // 闰年2月加1天
        if (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)) {
            daysInMonth[1] = 29;
        }

        for (month = 1; month <= 12; month++) {
            if (daysSinceEpoch < daysInMonth[month - 1]) break;
            daysSinceEpoch -= daysInMonth[month - 1];
        }
        day = daysSinceEpoch + 1; // 天数从1开始

    }

    function isAfterDeadline(uint256 deadline) public view returns (bool) {
        return block.timestamp > deadline;
    }
    

}