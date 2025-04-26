
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Counter} from "../src/Counter.sol";

contract CounterTest is Test {
    Counter public counter;

    function setUp() public {
        counter = new Counter();
    }

    function test_GetInitialCount() public view {
        uint256 current = counter.get();
        assertEq(current, 0, "Initial count should be 0");
    }

    function test_Increment() public {
        counter.inc();
        uint256 current = counter.get();
        assertEq(current, 1, "Count should be incremented to 1");
    }

    function test_Decrement() public {
        counter.inc(); // First increment to 1
        counter.dec(); // Then decrement back to 0
        uint256 current = counter.get();
        assertEq(current, 0, "Count should be decremented back to 0");
    }

    function test_DecrementShouldFailIfZero() public {
        vm.expectRevert("Counter: cannot decrement below zero");
        counter.dec();
    }

    function test_Reset() public {
        counter.inc();
        counter.inc();
        counter.reset();
        uint256 current = counter.get();
        assertEq(current, 0, "Count should reset to 0");
    }
}
