# NSOperationQueue Memory Leak with Cancelled Operations

This repository demonstrates a common memory leak issue in Objective-C when using `NSOperationQueue` and cancelling operations.  The `BuggyOperation.m` file shows the problematic code, where cancelling an operation doesn't immediately release resources held by the operation.  The `FixedOperation.m` file provides a solution using weak references or operation's `cancel` method to prevent this leak.  This is crucial for handling potentially long-running or memory-intensive operations.

## Reproducing the Issue

1. Clone the repository.
2. Compile and run `BuggyOperation.m`. Observe memory usage over time. Cancelling operations will not immediately free memory. 
3. Compile and run `FixedOperation.m`. Observe that memory usage is managed more efficiently upon cancellation.

## Solution

The solution involves ensuring that strong references within the operation are properly managed when the operation is cancelled.