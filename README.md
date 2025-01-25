# Race Condition Bug in Bash
This repository demonstrates a race condition bug in a bash script. Two processes concurrently write to files, leading to unpredictable and incomplete output.  The solution involves using proper synchronization mechanisms to avoid the race condition.

## Bug Description
The `bug.sh` script starts two background processes that continuously write to separate files. Due to the lack of synchronization, the output is not reliable as the processes can be interleaved in an unpredictable manner and potentially lose data due to being prematurely terminated.

## Solution
The solution, in `bugSolution.sh`, uses locking mechanisms to ensure that only one process can write to the files at a time, thereby preventing the race condition and ensuring data integrity.

## How to run
1. Clone the repository.
2. Run `bash bug.sh` to observe the race condition.
3. Run `bash bugSolution.sh` to see the corrected behavior.